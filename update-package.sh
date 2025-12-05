#!/bin/bash
set -euo pipefail

# Script to update fresh-editor PKGBUILD from latest GitHub release

REPO="sinelaw/fresh"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKGBUILD="$SCRIPT_DIR/PKGBUILD"
SRCINFO="$SCRIPT_DIR/.SRCINFO"

echo "Fetching latest release from GitHub..."

# Get latest release info from GitHub API
RELEASE_JSON=$(curl -s "https://api.github.com/repos/$REPO/releases/latest")

# Extract version (remove 'v' prefix)
LATEST_VERSION=$(echo "$RELEASE_JSON" | jq -r '.tag_name' | sed 's/^v//')

if [[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]]; then
    echo "Error: Could not fetch latest version from GitHub"
    exit 1
fi

echo "Latest version: $LATEST_VERSION"

# Get current version from PKGBUILD
CURRENT_VERSION=$(grep -Po '^pkgver=\K.*' "$PKGBUILD")
echo "Current version: $CURRENT_VERSION"

if [[ "$CURRENT_VERSION" == "$LATEST_VERSION" ]]; then
    echo "Already up to date!"
    exit 0
fi

# Construct download URL for x86_64
TARBALL_URL="https://github.com/$REPO/releases/download/v$LATEST_VERSION/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"

echo "Downloading tarball to compute sha256..."
echo "URL: $TARBALL_URL"

# Download and compute sha256
TMPFILE=$(mktemp)
trap "rm -f $TMPFILE" EXIT

if ! curl -fsSL "$TARBALL_URL" -o "$TMPFILE"; then
    echo "Error: Failed to download tarball"
    exit 1
fi

SHA256=$(sha256sum "$TMPFILE" | cut -d' ' -f1)
echo "SHA256: $SHA256"

# Update PKGBUILD
echo "Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" "$PKGBUILD"
sed -i "s/^sha256sums=.*/sha256sums=(\"$SHA256\")/" "$PKGBUILD"

# Regenerate .SRCINFO
echo "Regenerating .SRCINFO..."
cd "$SCRIPT_DIR"
makepkg --printsrcinfo > "$SRCINFO"

echo ""
echo "Update complete!"
echo "  Version: $CURRENT_VERSION -> $LATEST_VERSION"
echo "  SHA256: $SHA256"
echo ""
echo "Don't forget to commit the changes!"
