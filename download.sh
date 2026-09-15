#!/usr/bin/env bash
set -euo pipefail
asset=${1#vinci://}
[[ $1 == vinci://* && $asset =~ ^[0-9]+$ ]] || { echo 'Invalid Vinci asset ID' >&2; exit 1; }
# gh handles authenticated API downloads and signed redirects without exposing tokens.
gh api --hostname github.com -H 'Accept: application/octet-stream' \
  "repos/meetvinci/vinci/releases/assets/$asset" > "$2"
