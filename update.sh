#!/usr/bin/env bash
# Point the PKGBUILD at a screenie release (default: the latest) and regenerate .SRCINFO.
#   ./update.sh [vX.Y.Z] [--commit]
set -euo pipefail
cd "$(dirname "$0")"

tag= commit=
for arg; do
  case $arg in
    --commit) commit=1 ;;
    *) tag=$arg ;;
  esac
done

release=$(gh release view ${tag:+"$tag"} --repo johnpyp/screenie --json tagName,assets)
pkgver=$(jq -r '.tagName | ltrimstr("v")' <<<"$release")
[[ $pkgver == *-* ]] && { echo "v$pkgver is a pre-release" >&2; exit 1; }

if [[ $(sed -n 's/^pkgver=//p' PKGBUILD) != "$pkgver" ]]; then
  sed -i "s/^pkgver=.*/pkgver=$pkgver/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD
fi
for arch in x86_64 aarch64; do
  sum=$(jq -r --arg name "screenie-$pkgver-$arch-unknown-linux-gnu.tar.gz" \
    '.assets[] | select(.name == $name) | .digest | ltrimstr("sha256:")' <<<"$release")
  [[ $sum =~ ^[0-9a-f]{64}$ ]] || { echo "no sha256 for $arch in v$pkgver" >&2; exit 1; }
  sed -i "s/^sha256sums_$arch=.*/sha256sums_$arch=('$sum')/" PKGBUILD
done
makepkg --printsrcinfo >.SRCINFO

git --no-pager diff --stat HEAD -- PKGBUILD .SRCINFO
version="$pkgver-$(sed -n 's/^pkgrel=//p' PKGBUILD)"
if [[ $commit ]] && ! git diff --quiet HEAD -- PKGBUILD .SRCINFO; then
  git commit -q -m "screenie-bin $version" -- PKGBUILD .SRCINFO
  echo "committed screenie-bin $version"
else
  echo "screenie-bin $version"
fi
