#!/bin/bash

# Pure-FTPd version checker and updater script

DOWNLOAD_URL="https://download.pureftpd.org/pub/pure-ftpd/releases/"
PKGBUILD_PATH="${1:-PKGBUILD}"

# Download HTML page and extract the latest version
echo "Checking Pure-FTPd version..."

# Download HTML and extract version
latest_version=$(curl -s "$DOWNLOAD_URL" | \
    grep -oP 'pure-ftpd-\K[0-9]+\.[0-9]+\.[0-9]+(?=\.tar\.(gz|bz2))' | \
    sort -V | \
    tail -n1)

if [ -z "$latest_version" ]; then
    echo "Error: Failed to determine the latest version!"
    exit 1
fi

echo "Latest version: $latest_version"

# Read PKGBUILD version
if [ ! -f "$PKGBUILD_PATH" ]; then
    echo "Error: PKGBUILD file not found: $PKGBUILD_PATH"
    exit 1
fi

pkgbuild_version=$(grep -oP '^pkgver=\K.*' "$PKGBUILD_PATH")

if [ -z "$pkgbuild_version" ]; then
    echo "Error: Failed to read PKGBUILD version!"
    exit 1
fi

echo "PKGBUILD version: $pkgbuild_version"

# Version comparison
if [ "$latest_version" = "$pkgbuild_version" ]; then
    echo "✓ PKGBUILD is up to date!"
    exit 0
fi

echo "⚠ Update required!"
echo "  Current: $pkgbuild_version"
echo "  Available: $latest_version"
echo ""

# Download
tarball="pure-ftpd-${latest_version}.tar.bz2"
download_file="${DOWNLOAD_URL}${tarball}"

echo "Downloading: $download_file"
if ! curl -f -L -O "$download_file"; then
    echo "Error: Download failed!"
    exit 1
fi

echo "✓ Download complete: $tarball"

# Calculate SHA256 checksum
echo "Calculating SHA256 checksum..."
new_checksum=$(sha256sum "$tarball" | awk '{print $1}')
echo "New checksum: $new_checksum"

# Extract old checksum (first element from sha256sums array)
old_checksum=$(grep -A 100 "^sha256sums=" "$PKGBUILD_PATH" | \
    grep -oP "^sha256sums=\('\K[a-f0-9]{64}" | \
    head -n1)

if [ -z "$old_checksum" ]; then
    echo "Error: Failed to extract old checksum!"
    exit 1
fi

echo "Old checksum: $old_checksum"

# Update PKGBUILD
echo "Updating PKGBUILD..."

# Update version
sed -i "s/^pkgver=.*/pkgver=${latest_version}/" "$PKGBUILD_PATH"

# Update checksum (only the first checksum)
sed -i "s/${old_checksum}/${new_checksum}/" "$PKGBUILD_PATH"

makepkg --printsrcinfo > .SRCINFO

echo "✓ PKGBUILD updated!"
echo ""
echo "Summary:"
echo "  Version:      $pkgbuild_version → $latest_version"
echo "  Downloaded:   $tarball"
echo "  New checksum: $new_checksum"
echo ""
echo -e "Test the changes:\n"
echo -e "  makepkg -CL"
echo -e "  pacman -U pure-ftpd-db-${latest_version}-1-x86_64.pkg.tar*"
echo -e "\nCommit and push the changes to the Aur repository:\n"
echo -e "  git commit -a -m \"upgpkg: pure-ftpd-db $latest_version-1\""
echo -e "  git push"

exit 0
