#!/usr/bin/env bash
# Check HTTP status of all tool links in _tools/*.md
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TOOLS_DIR="$ROOT/_tools"
FAIL=0

echo "status|http|title|link|file"

for f in "$TOOLS_DIR"/*.md; do
  title=$(grep '^title:' "$f" | sed 's/^title: //')
  link=$(grep '^link:' "$f" | sed 's/^link: //')
  status=$(grep '^status:' "$f" | sed 's/^status: //')
  code=$(curl -sL -o /dev/null -w "%{http_code}" --max-time 20 "$link" 2>/dev/null || echo "ERR")
  echo "$status|$code|$title|$link|$(basename "$f")"
  if [[ "${1:-}" == "--fail-on-error" && "$status" == "active" && ! "$code" =~ ^2 ]]; then
    FAIL=1
  fi
done

exit $FAIL