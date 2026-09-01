#!/bin/bash
# llm-bin: prebuilt static-musl binary from GitHub releases. Version detection
# uses GitHub releases/latest (tags are plain v<ver>). Two per-arch tarballs
# plus the repo LICENSE share the source/sha256sums arrays.
set -e

REPO="imjiaoyuan/llm"
PKGNAME="rust-llm-bin"

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

BASE="https://github.com/${REPO}/releases/download/v${LATEST_VERSION}"
LICENSE_URL="https://raw.githubusercontent.com/${REPO}/main/LICENSE"

curl -sL "${BASE}/llm-x86_64-unknown-linux-musl.tar.gz" -o /tmp/${PKGNAME}-x86_64.tar.gz
curl -sL "${BASE}/llm-aarch64-unknown-linux-musl.tar.gz" -o /tmp/${PKGNAME}-aarch64.tar.gz
curl -sL "$LICENSE_URL" -o /tmp/${PKGNAME}-LICENSE

SHA_X86=$(sha256sum /tmp/${PKGNAME}-x86_64.tar.gz | awk '{print $1}')
SHA_AARCH64=$(sha256sum /tmp/${PKGNAME}-aarch64.tar.gz | awk '{print $1}')
SHA_LICENSE=$(sha256sum /tmp/${PKGNAME}-LICENSE | awk '{print $1}')

rm -f /tmp/${PKGNAME}-x86_64.tar.gz /tmp/${PKGNAME}-aarch64.tar.gz /tmp/${PKGNAME}-LICENSE

echo "x86_64:   $SHA_X86"
echo "aarch64:  $SHA_AARCH64"
echo "LICENSE:  $SHA_LICENSE"

echo "==> Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/^sha256sums=(.*)$/sha256sums=('$SHA_LICENSE')/" PKGBUILD
sed -i "s/^sha256sums_x86_64=(.*)$/sha256sums_x86_64=('$SHA_X86')/" PKGBUILD
sed -i "s/^sha256sums_aarch64=(.*)$/sha256sums_aarch64=('$SHA_AARCH64')/" PKGBUILD

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
