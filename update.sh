#!/bin/bash

set -euo pipefail

# 1. Fetch JSON manifests
echo "Fetching manifests..."
MANIFEST_X64=$(curl -sSfL "https://antigravity-cli-auto-updater-974169037036.us-central1.run.app/manifests/linux_amd64.json")
MANIFEST_ARM=$(curl -sSfL "https://antigravity-cli-auto-updater-974169037036.us-central1.run.app/manifests/linux_arm64.json")

# 2. Extract values using python3 to avoid sed/awk fragility
URL_X64=$(echo "$MANIFEST_X64" | python3 -c "import sys, json; print(json.load(sys.stdin)['url'])")
URL_ARM=$(echo "$MANIFEST_ARM" | python3 -c "import sys, json; print(json.load(sys.stdin)['url'])")

# Extract version from x64 URL (which is standard)
# Example URL: https://storage.googleapis.com/antigravity-public/antigravity-cli/1.0.0-5288553236791296/linux-x64/cli_linux_x64.tar.gz
PKGVER_RAW=$(echo "$URL_X64" | grep -oP 'antigravity-cli/\K[^/]+')
PKGVER=${PKGVER_RAW//-/_}

echo "Latest version found: $PKGVER"

# Create a temporary directory in the workspace for calculating SHA256 sums
TEMP_DIR="tmp_update_dir"
mkdir -p "$TEMP_DIR"
trap 'rm -rf "$TEMP_DIR"' EXIT

echo "Downloading x86_64 package..."
curl -sSfL -o "$TEMP_DIR/x64.tar.gz" "$URL_X64"
SHA256_X86_64=$(sha256sum "$TEMP_DIR/x64.tar.gz" | cut -d ' ' -f 1)

echo "Downloading aarch64 package..."
curl -sSfL -o "$TEMP_DIR/arm.tar.gz" "$URL_ARM"
SHA256_AARCH64=$(sha256sum "$TEMP_DIR/arm.tar.gz" | cut -d ' ' -f 1)

echo "SHA256 (x86_64): $SHA256_X86_64"
echo "SHA256 (aarch64): $SHA256_AARCH64"

# Update PKGBUILD
echo "Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$PKGVER/" PKGBUILD
sed -i "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('$SHA256_X86_64')/" PKGBUILD
sed -i "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('$SHA256_AARCH64')/" PKGBUILD

# Generate .SRCINFO
echo "Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "Successfully updated to $PKGVER!"
