#!/usr/bin/env bash
# Check HTTP status of external links for tools, cases, reports, and lardigmer.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
UA="Mozilla/5.0 (compatible; OpenGovSE-LinkChecker/1.0; +https://opengov.se)"
FAIL=0
MIRROR=0
FORCE=0
EXTRA_ARGS=()

for arg in "$@"; do
  case "$arg" in
    --mirror-reports|--download-pdfs) MIRROR=1 ;;
    --fail-on-error) EXTRA_ARGS+=("$arg") ;;
    --force) FORCE=1; EXTRA_ARGS+=("$arg") ;;
  esac
done

check_url() {
  local url="$1"
  curl -sL -A "$UA" -o /dev/null -w "%{http_code}" --max-time 20 "$url" 2>/dev/null || echo "ERR"
}

echo "source|status|http|title|url|file"

# Tools
for f in "$ROOT/_tools"/*.md; do
  [[ -f "$f" ]] || continue
  title=$(grep '^title:' "$f" 2>/dev/null | head -1 | sed 's/^title: //' || true)
  link=$(grep '^link:' "$f" 2>/dev/null | head -1 | sed 's/^link: //' || true)
  status=$(grep '^status:' "$f" 2>/dev/null | head -1 | sed 's/^status: //' || true)
  [[ -n "$link" ]] || continue
  code=$(check_url "$link")
  echo "tools|$status|$code|$title|$link|$(basename "$f")"
  if [[ " ${EXTRA_ARGS[*]} " == *" --fail-on-error "* && "$status" == "active" && ! "$code" =~ ^2 ]]; then
    FAIL=1
  fi
done

# Cases
for f in "$ROOT/_cases"/*.md; do
  [[ -f "$f" ]] || continue
  title=$(grep '^title:' "$f" 2>/dev/null | head -1 | sed 's/^title: //' || true)
  link=$(grep '^link:' "$f" 2>/dev/null | head -1 | sed 's/^link: //' || true)
  status=$(grep '^status:' "$f" 2>/dev/null | head -1 | sed 's/^status: //' || true)
  [[ -n "$link" ]] || continue
  code=$(check_url "$link")
  echo "cases|${status:-n/a}|$code|$title|$link|$(basename "$f")"
done

# Reports (via Ruby for structured YAML access)
while IFS='|' read -r title url status; do
  [[ -n "$url" ]] || continue
  code=$(check_url "$url")
  echo "reports|${status:-n/a}|$code|$title|$url|reports.yml"
done < <(ruby -ryaml -e '
  data = YAML.load_file(ARGV[0])
  data["categories"].each do |cat|
    cat["items"].each do |item|
      title = item["title"].to_s.gsub("|", "/")
      puts [title, item["url"], item["status"]].join("|")
    end
  end
' "$ROOT/_data/reports.yml")

# Lär dig mer
while IFS= read -r link; do
  [[ -n "$link" ]] || continue
  code=$(check_url "$link")
  echo "lardigmer|n/a|$code|$link|$link|lardigmer.md"
done < <(grep -oE 'href="https?://[^"]+' "$ROOT/lardigmer.md" | sed 's/href="//' | sort -u)

if [[ "$MIRROR" -eq 1 ]]; then
  mirror_args=()
  [[ "$FORCE" -eq 1 ]] && mirror_args+=(--force)
  ruby "$ROOT/scripts/mirror-reports.rb" "${mirror_args[@]}"
fi

exit $FAIL