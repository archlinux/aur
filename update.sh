#!/usr/bin/env bash
# Bump PKGBUILD to the latest stable release listed in the upstream manifest.
set -euo pipefail
cd "$(dirname "$0")"

manifest=$(curl -fsSL https://dl.sanalyer.com/desktop/stable/linux/x64/latest.json)
version=$(jq -r '.version' <<<"$manifest")
sha256=$(jq -r '.files.tar_gz.sha256' <<<"$manifest")
current=$(source PKGBUILD && echo "$pkgver")

if [[ "$version" == "$current" ]]; then
  echo "Already up to date ($current)"
  exit 0
fi

sed -i \
  -e "s/^pkgver=.*/pkgver=$version/" \
  -e "s/^pkgrel=.*/pkgrel=1/" \
  -e "0,/^sha256sums=('[0-9a-f]\{64\}'/s//sha256sums=('$sha256'/" \
  PKGBUILD
makepkg --printsrcinfo > .SRCINFO
echo "Updated $current -> $version"
