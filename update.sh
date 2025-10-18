#!/usr/bin/env bash

set -euo pipefail

LATEST_URL="https://github.com/clash-verge-rev/clash-verge-rev/releases/download/autobuild/latest.json"

echo "Downloading latest.json..."
curl -fsSL "$LATEST_URL" -o latest.json

new_version="$(jq -r '.version' latest.json)"
if [[ -z "$new_version" || "$new_version" == "null" ]]; then
  echo "Failed to obtain version from latest.json." >&2
  exit 1
fi

current_version="$(grep -E '^pkgver=' PKGBUILD | cut -d= -f2-)"

if [[ "$current_version" != "$new_version" ]]; then
  echo "Updating pkgver from ${current_version} to ${new_version}..."
  sed -i "s/^pkgver=.*/pkgver=${new_version}/" PKGBUILD
  sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
else
  echo "pkgver already at ${new_version}."
fi

echo "Regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "Done."
