#!/usr/bin/env ruby
# frozen_string_literal: true

require "yaml"
require "json"
require "date"

ROOT = File.expand_path("..", __dir__)
MANIFEST_PATH = ARGV[0] || File.join(ROOT, "assets/reports/manifest.json")
REPORTS_YML = File.join(ROOT, "_data/reports.yml")
CASES_DIR = File.join(ROOT, "_cases")

manifest = JSON.parse(File.read(MANIFEST_PATH))
reports = YAML.load_file(REPORTS_YML)

reports["categories"].each do |category|
  category["items"].each do |item|
    next unless item["title"] == "Öppna Data 2014 Nulägesanalys"

    item["url"] = "https://www.vinnova.se/contentassets/968bf22a8c2b4505bcf06d44321dff24/vr_14_04.pdf"
  end
end

reports["categories"].each do |category|
  category["items"].each do |item|
    entry = manifest[item["url"]]
    next unless entry && !entry["unresolved"]

    item["mirror"] = "/#{entry['local']}"
    item["mirror_format"] = entry["format"]
    item["primary_ok"] = entry["primary_ok"]

    if entry["fallback_url"]
      item["fallback_url"] = entry["fallback_url"]
    else
      item.delete("fallback_url")
    end
  end
end

File.write(REPORTS_YML, reports.to_yaml)

Dir.glob(File.join(CASES_DIR, "*.md")).each do |path|
  content = File.read(path)
  next unless content.match?(/\A---\n.*?\n---\n/m)

  fm_yaml = content[/\A---\n(.*?)\n---\n/m, 1]
  body = content.sub(/\A---\n.*?\n---\n/m, "")
  next unless fm_yaml

  fm = YAML.safe_load(fm_yaml, permitted_classes: [Date, Time])
  link = fm["link"]
  next unless link

  entry = manifest[link]
  next unless entry && !entry["unresolved"]

  fm["mirror"] = "/#{entry['local']}"
  fm["mirror_format"] = entry["format"]
  fm["primary_ok"] = entry["primary_ok"]
  if entry["fallback_url"]
    fm["fallback_url"] = entry["fallback_url"]
  else
    fm.delete("fallback_url")
  end

  # Hash#to_yaml already includes a leading "---" document marker.
  body = body.end_with?("\n") ? body : "#{body}\n"
  File.write(path, "#{fm.to_yaml}---\n#{body}")
end

puts "Updated #{REPORTS_YML} and case files from manifest."