#!/usr/bin/env bash
# Update nitrile-bin PKGBUILD to a given version (or the latest one).
# Usage: ./update-pkgbuild.sh [version]
set -euo pipefail

cd "$(dirname "$0")"
PKG=PKGBUILD
API=https://clean-lang.org/api/packages/nitrile

ver="${1:-}"
if [[ -z "$ver" ]]; then
  ver=$(curl -s "$API" | jq -r .latest_version)
fi

url=$(curl -s "$API" | jq -r --arg v "$ver" '.versions[$v].targets."linux-x64".url')
if [[ -z "$url" || "$url" == "null" ]]; then
  echo "Error: no linux-x64 target for version $ver" >&2
  exit 1
fi

sum=$(curl -sL "$url" | sha256sum | cut -d' ' -f1)

sed -i "s/^pkgver=.*/pkgver=$ver/" "$PKG"
sed -i "s/^sha256sums=(.*/sha256sums=('$sum')/" "$PKG"

echo "Updated PKGBUILD to nitrile $ver"
echo "  url:   $url"
echo "  sha256:$sum"