#!/usr/bin/env bash

set -eu -o pipefail

_curl() { curl --silent --show-error --fail-with-body "$@"; }

REPO=itsjfx/sway-alttab-gui

cd "$(dirname "$0")"

echo "Fetching latest release from GitHub..."
VERSION="$(_curl "https://api.github.com/repos/$REPO/releases/latest" | jq -re '.tag_name' | sed 's/^v//')"

echo "Updating PKGBUILD to version $VERSION"

# Fetch sha256sums from release
echo "Fetching sha256sums..."

fetch_sha256() { _curl -L "https://github.com/$REPO/releases/download/v$VERSION/sway-alttab-gui-linux-$1.sha256" | awk '{print $1}'; }

SHA256_AMD64="$(fetch_sha256 amd64)"
SHA256_ARM64="$(fetch_sha256 arm64)"

echo "  x86_64: $SHA256_AMD64"
echo "  aarch64: $SHA256_ARM64"

# Update PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('$SHA256_AMD64')/" PKGBUILD
sed -i "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('$SHA256_ARM64')/" PKGBUILD

cat PKGBUILD

makepkg --printsrcinfo >.SRCINFO

cat .SRCINFO
