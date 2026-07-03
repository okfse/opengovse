#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"
require "json"
require "digest"
require "fileutils"
require "open3"
require "uri"
require "date"

ROOT = File.expand_path("..", __dir__)
REPORTS_DIR = File.join(ROOT, "assets/reports")
MANIFEST_PATH = File.join(REPORTS_DIR, "manifest.json")
REPORTS_YML = File.join(ROOT, "_data/reports.yml")
FALLBACKS_YML = File.join(ROOT, "_data/report_fallbacks.yml")
UA = "Mozilla/5.0 (compatible; OpenGovSE-Mirror/1.0; +https://opengov.se)"
FORCE = ARGV.include?("--force")

FileUtils.mkdir_p(REPORTS_DIR)

def slugify(title, year = nil)
  base = title.downcase
              .gsub(/[åä]/, "a")
              .gsub(/ö/, "o")
              .gsub(/[–—]/, "-")
              .encode("UTF-8", invalid: :replace, undef: :replace, replace: "")
              .gsub(/[^a-z0-9]+/, "-")
              .gsub(/\A-+|-+\z/, "")
              .slice(0, 80)
  year ? "#{base}-#{year}" : base
end

def curl_request(url, output: nil, head: false)
  cmd = ["curl", "-sL", "-A", UA, "--max-time", "30", "-w", "\n%{http_code}|%{content_type}"]
  cmd += head ? ["-I"] : []
  cmd += ["-o", output || "/dev/null", url]

  stdout, status = Open3.capture2e(*cmd)
  lines = stdout.lines
  meta = lines.pop.to_s.strip
  http_code, content_type = meta.split("|", 2)
  http_code = "ERR" unless status.success? || http_code.to_i.positive?
  [http_code, content_type.to_s.strip, head ? nil : stdout]
rescue StandardError
  ["ERR", "", nil]
end

def success?(code)
  code.to_s.match?(/\A2\d{2}\z/)
end

def pdf_content?(body, content_type, url)
  return true if body&.start_with?("%PDF")
  return true if content_type.include?("application/pdf")
  return true if url.match?(/\.pdf(\?|$)/i)

  false
end

def html_content?(body, content_type, url)
  return false if pdf_content?(body, content_type, url)

  content_type.include?("text/html") || body.to_s.lstrip.start_with?("<!DOCTYPE", "<html", "<HTML")
end

def detect_format(body, content_type, url)
  pdf_content?(body, content_type, url) ? "pdf" : "html"
end

def wayback_snapshot(url, prefer_pdf: false)
  cdx = "https://web.archive.org/cdx/search/cdx?url=#{URI.encode_www_form_component(url)}" \
        "&filter=statuscode:200&output=json&limit=15"
  stdout, status = Open3.capture2("curl", "-s", "-A", UA, "--max-time", "15", cdx)
  return nil unless status.success?

  rows = JSON.parse(stdout)
  return nil if rows.size < 2

  candidates = rows[1..].map do |row|
    {
      timestamp: row[1],
      original: row[2],
      mime: row[3].to_s
    }
  end

  if prefer_pdf
    pdf_hit = candidates.find { |c| c[:mime].include?("pdf") || c[:original].match?(/\.pdf(\?|$)/i) }
    return pdf_hit if pdf_hit
  end

  candidates.first
rescue StandardError
  nil
end

def download_url(url)
  tmp = File.join(REPORTS_DIR, ".tmp-download")
  code, content_type, = curl_request(url, output: tmp)
  return nil unless success?(code) && File.size?(tmp).to_i > 1024

  body = File.binread(tmp)
  format = detect_format(body, content_type, url)
  [body, format, code, content_type, url, nil]
ensure
  File.delete(tmp) if File.exist?(tmp)
end

def resolve_report(item, fallbacks)
  primary = item["url"]
  title = item["title"]
  year = item["year"]
  slug = slugify(title, year)

  primary_code, = curl_request(primary, head: true)
  primary_ok = success?(primary_code)
  resolved_via = "primary"
  resolved_url = primary
  wayback_timestamp = nil
  prefer_pdf = primary.match?(/\.pdf(\?|$)/i)

  body = nil
  format = nil
  http_code = primary_code

  unless primary_ok
    curated = fallbacks[title]
    if curated && curated["fallback_url"]
      result = download_url(curated["fallback_url"])
      if result
        body, format, http_code, _, resolved_url, = result
        resolved_via = "curated"
      end
    end

    unless body
      wayback_targets = [primary]
      if title.include?("McKinsey") || primary.include?("mckinsey.com")
        wayback_targets << "https://www.mckinsey.com/~/media/mckinsey/business%20functions/mckinsey%20digital/our%20insights/open%20data%20unlocking%20innovation%20and%20performance%20with%20liquid%20information/mgi_open_data_fullreport_oct2013.pdf"
      end

      wayback_targets.each do |target|
        snapshot = wayback_snapshot(target, prefer_pdf: true)
        next unless snapshot

        archive_url = "https://web.archive.org/web/#{snapshot[:timestamp]}/#{target}"
        result = download_url(archive_url)
        next unless result

        body, format, http_code, _, resolved_url, = result
        resolved_via = "wayback"
        wayback_timestamp = snapshot[:timestamp]
        break
      end
    end
  end

  if primary_ok
    2.times do
      result = download_url(primary)
      next unless result

      body, format, http_code, _, resolved_url, = result
      resolved_via = "primary"
      break
    end
  end

  unless body
    warn "Unresolved: #{title} (#{primary})"
    return [
      primary,
      {
        "primary_ok" => primary_ok,
        "primary_http" => primary_code.to_s,
        "unresolved" => true
      }
    ]
  end

  ext = format == "pdf" ? "pdf" : "html"
  local_rel = "assets/reports/#{slug}.#{ext}"
  local_abs = File.join(ROOT, local_rel)
  sha256 = Digest::SHA256.hexdigest(body)

  existing = JSON.parse(File.read(MANIFEST_PATH))[primary] rescue nil
  if !FORCE && existing && existing["sha256"] == sha256 && File.exist?(local_abs)
    puts "unchanged: #{title} -> #{local_rel}"
  else
    File.binwrite(local_abs, body)
    puts "mirrored: #{title} -> #{local_rel} (#{resolved_via})"
  end

  fallback_url = resolved_via == "primary" ? nil : resolved_url

  [
    primary,
    {
      "local" => local_rel,
      "format" => format,
      "resolved_url" => resolved_url,
      "resolved_via" => resolved_via,
      "fallback_url" => fallback_url,
      "primary_ok" => primary_ok,
      "primary_http" => primary_code.to_s,
      "wayback_timestamp" => wayback_timestamp,
      "sha256" => sha256,
      "verified_at" => Date.today.iso8601,
      "unresolved" => false
    }
  ]
end

reports = YAML.load_file(REPORTS_YML)
fallbacks = File.exist?(FALLBACKS_YML) ? YAML.load_file(FALLBACKS_YML) : {}
manifest = File.exist?(MANIFEST_PATH) ? JSON.parse(File.read(MANIFEST_PATH)) : {}

reports["categories"].each do |category|
  category["items"].each do |item|
    next unless item["title"] == "Öppna Data 2014 Nulägesanalys"

    item["url"] = "https://www.vinnova.se/contentassets/968bf22a8c2b4505bcf06d44321dff24/vr_14_04.pdf"
  end
end

results = []

reports["categories"].each do |category|
  category["items"].each do |item|
    primary_url, entry = resolve_report(item, fallbacks)
    manifest[primary_url] = entry
    results << entry unless entry["unresolved"]
  end
end

File.write(MANIFEST_PATH, JSON.pretty_generate(manifest))
system("ruby", File.join(__dir__, "update-mirrors.rb"), MANIFEST_PATH) || exit(1)