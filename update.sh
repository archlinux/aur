#!/bin/bash
# llm: source build of the AI hub. Version detection uses GitHub
# releases/latest (tags are plain v<ver>); the single source tarball is the
# GitHub tag archive, so checksums use the single-line sed pattern.
set -e

REPO="imjiaoyuan/llm"
PKGNAME="rust-llm"

echo "==> Checking for new version..."

LATEST_TAG=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep -oP '"tag_name": "\K[^"]+' | head -1)
LATEST_VERSION=${LATEST_TAG#v}

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

TARBALL_URL="https://github.com/${REPO}/archive/refs/tags/v${LATEST_VERSION}.tar.gz"
echo "Downloading $TARBALL_URL..."
curl -sL "$TARBALL_URL" -o /tmp/${PKGNAME}-${LATEST_VERSION}.tar.gz

SHA256=$(sha256sum /tmp/${PKGNAME}-${LATEST_VERSION}.tar.gz | awk '{print $1}')
echo "SHA256: $SHA256"

rm -f /tmp/${PKGNAME}-${LATEST_VERSION}.tar.gz

echo "==> Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=('$SHA256')/" PKGBUILD

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
