#!/usr/bin/env bash
set -euo pipefail

CHANNEL_URL="https://api.meta.ai/muse-code/channels/muse-stable"

echo "Checking latest upstream release from ${CHANNEL_URL}..."
CHANNEL_DATA=$(curl -fsSL "${CHANNEL_URL}")
REALVER=$(echo "${CHANNEL_DATA}" | jq -r '.version')
MANIFEST_URL=$(echo "${CHANNEL_DATA}" | jq -r '.manifest_url')

echo "Upstream version: ${REALVER}"
echo "Manifest URL:     ${MANIFEST_URL}"

MANIFEST_DATA=$(curl -fsSL "${MANIFEST_URL}")
SHA256_X86=$(echo "${MANIFEST_DATA}" | jq -r '.artifacts.x86_linux.checksum')
SHA256_ARM=$(echo "${MANIFEST_DATA}" | jq -r '.artifacts.aarch64_linux.checksum')

echo "x86_64 sha256:   ${SHA256_X86}"
echo "aarch64 sha256:  ${SHA256_ARM}"

PKGVER=$(echo "${REALVER}" | sed 's/-R/\.r/g')

sed -i "s/^_realver=.*/_realver=\"${REALVER}\"/" PKGBUILD
sed -i "s/^pkgver=.*/pkgver=${PKGVER}/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
if [[ -f muse.sh ]]; then
  SHA256_WRAPPER=$(sha256sum muse.sh | cut -d' ' -f1)
  sed -i "s/^sha256sums=.*/sha256sums=('${SHA256_WRAPPER}')/" PKGBUILD
fi
sed -i "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${SHA256_X86}')/" PKGBUILD
sed -i "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('${SHA256_ARM}')/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
echo "Updated PKGBUILD and .SRCINFO to version ${PKGVER} (${REALVER})"
