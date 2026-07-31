#!/usr/bin/env bash
# Bumps pkgver in PKGBUILD and refreshes sha256sums, then regenerates .SRCINFO.
# Usage: ./update.sh <new-version>   e.g. ./update.sh 1.1.0
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <new-version>" >&2
  exit 1
fi

newver="$1"
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pkgbuild="$dir/PKGBUILD"

oldver="$(awk -F= '/^pkgver=/{print $2}' "$pkgbuild")"
echo "Updating pkgver: $oldver -> $newver"
sed -i "s/^pkgver=.*/pkgver=$newver/" "$pkgbuild"
sed -i "s/^pkgrel=.*/pkgrel=1/" "$pkgbuild"

sha256_of() {
  local url="$1"
  curl -fsSL "$url" | sha256sum | awk '{print $1}'
}

echo "Fetching new checksums..."

amd64_sum="$(sha256_of "https://github.com/lxc/incus-compose/releases/download/v$newver/incus-compose_${newver}_linux_amd64.tar.gz")"
arm64_sum="$(sha256_of "https://github.com/lxc/incus-compose/releases/download/v$newver/incus-compose_${newver}_linux_arm64.tar.gz")"

sed -i "s/^sha256sums_x86_64=('[^']*')/sha256sums_x86_64=('$amd64_sum')/" "$pkgbuild"
sed -i "s/^sha256sums_aarch64=('[^']*')/sha256sums_aarch64=('$arm64_sum')/" "$pkgbuild"

echo "Regenerating .SRCINFO..."
(cd "$dir" && makepkg --printsrcinfo > .SRCINFO)

echo "Done. New PKGBUILD:"
cat "$pkgbuild"
