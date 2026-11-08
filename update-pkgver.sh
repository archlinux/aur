#!/usr/bin/env bash
# Bump PKGBUILD to an upstream WebKVM release, verify and build it.
# Usage: ./update-pkgver.sh [tag]   e.g. 0.2.0 or v0.1.8-fix01; default: latest release
set -euo pipefail
cd "$(dirname "$0")"

repo=https://github.com/Slaker19/webkvm
tag=${1:-$(curl -fsSLI -o /dev/null -w '%{url_effective}' "$repo/releases/latest")}
tag=${tag##*/}
tag=${tag#v}
[[ $tag =~ ^[0-9]+(\.[0-9]+)*(-[A-Za-z0-9]+)?$ ]] || { echo "bad tag: $tag" >&2; exit 1; }
ver=${tag//-/.}

cur=$(sed -n 's/^_tag=//p' PKGBUILD)
if [[ $tag == "$cur" ]]; then
  echo "PKGBUILD already at $cur"
  exit 0
fi

sum=$(curl -fsSL "$repo/releases/download/v$tag/SHA256SUMS" |
  awk -v f="webkvm-$tag.tar.gz" '$2 == f || $2 == "*" f { print $1 }')
[[ $sum =~ ^[0-9a-f]{64}$ ]] || { echo "no sha256 for webkvm-$tag.tar.gz in SHA256SUMS" >&2; exit 1; }

cp PKGBUILD PKGBUILD.bak
sed -i -e "s/^_tag=.*/_tag=$tag/" \
       -e "s/^pkgver=.*/pkgver=$ver/" \
       -e "s/^pkgrel=.*/pkgrel=1/" \
       -e "s/^sha256sums=.*/sha256sums=('$sum')/" PKGBUILD

# Downloads the tarball, checks sha256, runs prepare() guards and packages.
if ! makepkg -fC --nodeps; then
  mv PKGBUILD.bak PKGBUILD
  echo "build failed, PKGBUILD restored" >&2
  exit 1
fi
rm PKGBUILD.bak
makepkg --printsrcinfo > .SRCINFO

echo "updated $cur -> $tag (pkgver=$ver, pkgrel=1)"
echo "review upstream changes: $repo/compare/v$cur...v$tag"
echo "install: sudo pacman -U webkvm-bin-$ver-1-x86_64.pkg.tar.zst"
