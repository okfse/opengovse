#!/usr/bin/env bash
# Backward-compatible wrapper — use scripts/check-links.sh
set -euo pipefail
exec "$(cd "$(dirname "$0")" && pwd)/check-links.sh" "$@"