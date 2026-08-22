#!/bin/bash
# Rewriter: takes the new upstream version as $1; version detection lives in
# the root nvchecker.toml.
# autocycler-bin has two sources (binary tarball + LICENSE), so checksums are
# refreshed with `updpkgsums` (pacman-contrib) instead of a single-line sed.
# Maintainer-side tool, never executed during package build or install.
set -e
[ $# -eq 1 ] || { echo "usage: $0 <new-version>" >&2; exit 1; }
LATEST_VERSION=${1#v}

REPO="rrwick/Autocycler"
URL="https://github.com/${REPO}"
PKGNAME="autocycler-bin"
CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $LATEST_VERSION"

echo "==> Updating to version $LATEST_VERSION..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo "==> Updating checksums (requires pacman-contrib)..."
updpkgsums

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
