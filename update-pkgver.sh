#!/usr/bin/env bash

set -euo pipefail

cmd_check() {
  local c
  for c in "$@"; do
    if ! command -v "$c" >/dev/null 2>&1; then
      echo "ERROR: required command not found: $c" >&2
      exit 1
    fi
  done
}
cmd_check nvchecker makepkg updpkgsums jq

json_log=$(nvchecker -c .nvchecker.toml --logger json --json-log-fd 1 2>/dev/null || true)
new_ver=$(printf '%s\n' "$json_log" |
  jq -r 'select(.event == "updated" and has("version")) | .version' |
  tail -n1)

if [ -z "$new_ver" ]; then
  echo "ERROR: nvchecker did not report a new version." >&2
  printf '%s\n' "$json_log" >&2
  exit 1
fi

current_ver=$(sed -n 's/^pkgver=//p' PKGBUILD)
echo "current: $current_ver"
echo "latest : $new_ver"

if [ "$new_ver" = "$current_ver" ]; then
  echo "Already up to date."
  exit 0
fi

sed -i "s/^pkgver=.*/pkgver=${new_ver}/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
echo "Updated pkgver=${new_ver} pkgrel=1"

updpkgsums
makepkg --printsrcinfo > .SRCINFO

echo "Done. Diff:"
git diff -- PKGBUILD .SRCINFO
