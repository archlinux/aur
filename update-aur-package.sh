#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <version-without-v>" >&2
  exit 1
fi

version="$1"

if ! command -v updpkgsums >/dev/null 2>&1; then
  echo "updpkgsums is required. Install pacman-contrib." >&2
  exit 1
fi

if ! command -v makepkg >/dev/null 2>&1; then
  echo "makepkg is required. Install base-devel." >&2
  exit 1
fi

sed -i \
  -e "s/^pkgver=.*/pkgver=${version}/" \
  -e "s/^pkgrel=.*/pkgrel=1/" \
  PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO
