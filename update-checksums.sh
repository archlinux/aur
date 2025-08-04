#!/bin/bash

# OpenOTP AUR Package Checksum Updater
# This script downloads the source and calculates checksums for the PKGBUILD

set -e

# Configuration
PKGNAME="openotp"
VERSION="1.1.3"
GITHUB_URL="https://github.com/Slipstreamm/OpenOTP"

echo "=== OpenOTP AUR Checksum Updater ==="
echo "Package: $PKGNAME"
echo "Version: $VERSION"
echo

# Download source tarball
echo "Downloading source tarball..."
SOURCE_FILE="${PKGNAME}-${VERSION}.tar.gz"
SOURCE_URL="${GITHUB_URL}/archive/v${VERSION}.tar.gz"

if [ -f "$SOURCE_FILE" ]; then
    echo "Removing existing $SOURCE_FILE"
    rm "$SOURCE_FILE"
fi

wget -O "$SOURCE_FILE" "$SOURCE_URL"

# Calculate checksums
echo "Calculating checksums..."
SOURCE_CHECKSUM=$(sha256sum "$SOURCE_FILE" | cut -d' ' -f1)
DESKTOP_CHECKSUM=$(sha256sum openotp.desktop | cut -d' ' -f1)

echo
echo "=== Checksums ==="
echo "Source ($SOURCE_FILE): $SOURCE_CHECKSUM"
echo "Desktop file (openotp.desktop): $DESKTOP_CHECKSUM"
echo

# Update PKGBUILD
echo "Current PKGBUILD sha256sums:"
grep "sha256sums=" PKGBUILD

echo
echo "Updated sha256sums line for PKGBUILD:"
echo "sha256sums=('$SOURCE_CHECKSUM'"
echo "            '$DESKTOP_CHECKSUM')"

# Clean up
rm "$SOURCE_FILE"

echo
echo "=== Next Steps ==="
echo "1. Update the sha256sums array in PKGBUILD with the values above"
echo "2. Run 'makepkg --printsrcinfo > .SRCINFO' to update .SRCINFO"
echo "3. Test build with 'makepkg -f'"
echo "4. Commit and push to AUR if everything works"
