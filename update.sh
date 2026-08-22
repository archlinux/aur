#!/bin/bash
# foldseek-bin: two sources (binary tarball + license fetched from the tagged source),
# so checksums are refreshed with `updpkgsums` (pacman-contrib) instead of a
# single-line sed. Version detection uses releases/latest; makepkg forbids
# hyphens in pkgver, so '-' becomes '_' and the raw tag lives in _tag.
set -e

REPO="steineggerlab/foldseek"
PKGNAME="foldseek-bin"
ASSET="foldseek-linux-avx2.tar.gz"

echo "==> Checking for new version..."

LATEST_TAG=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep -oP '"tag_name": "\K[^"]+' | head -1)
LATEST_VERSION=${LATEST_TAG#v}
LATEST_VERSION=${LATEST_VERSION//-/_}

if [ -z "$LATEST_VERSION" ]; then
    echo "Error: Could not fetch latest version"
    exit 1
fi

CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)

echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $LATEST_VERSION"

if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
    echo "==> Already up to date!"
    exit 0
fi

echo "==> Updating to version $LATEST_VERSION..."
sed -i "s/^_tag=.*/_tag=$LATEST_TAG/" PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo "==> Updating checksums (requires pacman-contrib)..."
updpkgsums

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
