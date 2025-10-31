#!/bin/bash

# Script to automatically update PKGBUILD with the latest CJsShell version and SHA256

set -e

REPO_PATH="/home/cadenfinley/Documents/GitHub/CJsShell"
PKGBUILD_PATH="/home/cadenfinley/Documents/GitHub/cjsh-AUR/PKGBUILD"

echo "Fetching latest version from CJsShell repository..."
cd "$REPO_PATH"
LATEST_VERSION=$(git describe --tags --abbrev=0)

if [ -z "$LATEST_VERSION" ]; then
    echo "Error: Could not determine latest version"
    exit 1
fi

echo "Latest version: $LATEST_VERSION"

# Get current version from PKGBUILD
CURRENT_VERSION=$(grep "^pkgver=" "$PKGBUILD_PATH" | cut -d= -f2)
echo "Current version in PKGBUILD: $CURRENT_VERSION"

if [ "$LATEST_VERSION" = "$CURRENT_VERSION" ]; then
    echo "PKGBUILD is already up to date!"
    exit 0
fi

echo "Downloading tarball for version $LATEST_VERSION..."
TARBALL_URL="https://github.com/CadenFinley/CJsShell/archive/${LATEST_VERSION}.tar.gz"
TEMP_DIR=$(mktemp -d)
TARBALL_PATH="$TEMP_DIR/cjsh-${LATEST_VERSION}.tar.gz"

curl -sL "$TARBALL_URL" -o "$TARBALL_PATH"

echo "Calculating SHA256 checksum..."
SHA256=$(sha256sum "$TARBALL_PATH" | cut -d' ' -f1)
echo "SHA256: $SHA256"

# Clean up temp directory
rm -rf "$TEMP_DIR"

echo "Updating PKGBUILD..."

# Update pkgver
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" "$PKGBUILD_PATH"

# Update sha256sums
sed -i "s/^sha256sums=.*/sha256sums=('$SHA256')/" "$PKGBUILD_PATH"

# Reset pkgrel to 1 when version changes
sed -i "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_PATH"

echo "PKGBUILD updated successfully!"
echo "  Version: $CURRENT_VERSION -> $LATEST_VERSION"
echo "  SHA256: $SHA256"
echo ""
echo "Don't forget to:"
echo "  1. Review the changes in PKGBUILD"
echo "  2. Test the build with 'makepkg -si'"
echo "  3. Update .SRCINFO with 'makepkg --printsrcinfo > .SRCINFO'"
echo "  4. Commit and push the changes"
