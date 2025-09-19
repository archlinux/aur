#!/bin/bash

# Script to prepare multidl for AUR submission

echo "==> Preparing multidl package for AUR submission..."

# Check if we're in the right directory
if [[ ! -f "pyproject.toml" ]] || [[ ! -f "PKGBUILD" ]]; then
    echo "Error: Run this script from the multidl project root directory"
    exit 1
fi

# Extract version from pyproject.toml
VERSION=$(grep '^version = ' pyproject.toml | cut -d'"' -f2)
echo "==> Detected version: $VERSION"

# Update PKGBUILD with current version
sed -i "s/pkgver=.*/pkgver=$VERSION/" PKGBUILD

# Download the source tarball to calculate checksum
TARBALL_URL="https://github.com/swayam25/Multi-DL/archive/v${VERSION}.tar.gz"
echo "==> Downloading source tarball from: $TARBALL_URL"

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Download the tarball
curl -L -o "multidl-${VERSION}.tar.gz" "$TARBALL_URL"

if [[ $? -ne 0 ]]; then
    echo "Error: Failed to download source tarball"
    echo "Make sure you have tagged and pushed version v$VERSION to GitHub"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Calculate SHA256 checksum
CHECKSUM=$(sha256sum "multidl-${VERSION}.tar.gz" | cut -d' ' -f1)
echo "==> Calculated SHA256: $CHECKSUM"

# Go back to project directory
cd - > /dev/null

# Update PKGBUILD with correct checksum
sed -i "s/sha256sums=('SKIP')/sha256sums=('$CHECKSUM')/" PKGBUILD

# Update .SRCINFO
sed -i "s/pkgver = .*/pkgver = $VERSION/" .SRCINFO
sed -i "s/sha256sums = SKIP/sha256sums = $CHECKSUM/" .SRCINFO

# Clean up
rm -rf "$TEMP_DIR"

echo "==> Package prepared successfully!"
echo "==> Files ready for AUR submission:"
echo "    - PKGBUILD"
echo "    - .SRCINFO"
echo "    - multidl.install"
echo ""
echo "==> Next steps:"
echo "    1. Test the package: makepkg -si"
echo "    2. Submit to AUR or update existing package"
echo "    3. Don't forget to update your email in PKGBUILD maintainer line"
