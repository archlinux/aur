#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

CURRENT_VER=$(grep '^pkgver=' PKGBUILD | cut -d= -f2)

echo "Checking upstream version..."
LATEST_VER=$(nvchecker -c .nvchecker.toml --logger json 2>&1 \
  | grep '"event": "updated"' \
  | grep -oP '"version": "\K[^"]+')

if [[ -z "$LATEST_VER" ]]; then
    echo "Error: could not determine latest version." >&2
    exit 1
fi

echo "Current: $CURRENT_VER"
echo "Latest:  $LATEST_VER"

if [[ "$CURRENT_VER" == "$LATEST_VER" ]]; then
    echo "Already up to date."
    exit 0
fi

echo "Updating $CURRENT_VER -> $LATEST_VER..."

BASE_URL="https://sbc-cli.obs.ru-moscow-1.hc.sbercloud.ru/cli/${LATEST_VER}"

echo "Computing checksums..."
SHA256_AMD64=$(curl -sL "${BASE_URL}/cloud-cli-linux-amd64.tar.gz" | sha256sum | cut -d' ' -f1)
SHA256_ARM64=$(curl -sL "${BASE_URL}/cloud-cli-linux-arm64.tar.gz" | sha256sum | cut -d' ' -f1)
echo "  x86_64: $SHA256_AMD64"
echo "  aarch64: $SHA256_ARM64"

sed -i \
    -e "s/^pkgver=.*/pkgver=${LATEST_VER}/" \
    -e "s/^pkgrel=.*/pkgrel=1/" \
    -e "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${SHA256_AMD64}')/" \
    -e "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('${SHA256_ARM64}')/" \
    PKGBUILD

makepkg --printsrcinfo > .SRCINFO

echo "Done. PKGBUILD and .SRCINFO updated to ${LATEST_VER}."
