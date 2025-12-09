#!/bin/bash
# Fetch Antigravity version info from Debian repo using distrobox
# This script runs inside the antigravity-fetch distrobox
# Usage: Called by ../fetch-antigravity-version.sh

set -e

echo "🔍 Fetching Antigravity version from Debian repository..."
echo ""

# Check if we're inside the distrobox
if [ ! -f /run/.containerenv ] && [ ! -f /.dockerenv ]; then
    echo "⚠️  This script should be run inside the antigravity-fetch distrobox"
    echo "   Use: distrobox enter antigravity-fetch"
    exit 1
fi

# Ensure apt repository is configured
if [ ! -f /etc/apt/sources.list.d/antigravity.list ]; then
    echo "📦 Setting up Antigravity repository..."
    
    # Create keyrings directory
    sudo mkdir -p /etc/apt/keyrings
    
    # Add GPG key
    curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/antigravity-repo-key.gpg
    
    # Add repository
    echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
        sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null
    
    echo "   ✓ Repository configured"
fi

# Update package cache
echo "🔄 Updating package cache..."
sudo apt update -qq

# Get version information
echo ""
echo "📋 Antigravity package information:"
echo ""

VERSION_INFO=$(apt-cache policy antigravity 2>/dev/null)

if [ -z "$VERSION_INFO" ]; then
    echo "❌ Could not fetch package information"
    exit 1
fi

echo "$VERSION_INFO"
echo ""

# Extract version number
DEBIAN_VERSION=$(echo "$VERSION_INFO" | grep "Candidate:" | awk '{print $2}')

if [ -z "$DEBIAN_VERSION" ]; then
    echo "❌ Could not extract version number"
    exit 1
fi

echo "📦 Latest Debian version: $DEBIAN_VERSION"
echo ""

# Try to download package metadata without installing
echo "🔍 Fetching package details..."
PACKAGE_INFO=$(apt-cache show antigravity 2>/dev/null)

# Extract filename if available
FILENAME=$(echo "$PACKAGE_INFO" | grep "^Filename:" | awk '{print $2}')

if [ -n "$FILENAME" ]; then
    echo "📁 Package filename: $FILENAME"
    
    # Try to extract build ID from filename or description
    # Filename might contain version-buildid pattern
    if [[ "$FILENAME" =~ antigravity.*([0-9]{16}) ]]; then
        BUILD_ID="${BASH_REMATCH[1]}"
        echo "🔑 Extracted Build ID: $BUILD_ID"
    fi
fi

# Download package to inspect (don't install)
echo ""
echo "⬇️  Downloading package for inspection..."
cd /tmp
apt download antigravity 2>/dev/null || true

# Find the downloaded .deb file
DEB_FILE=$(ls -t antigravity_*.deb 2>/dev/null | head -n1)

if [ -n "$DEB_FILE" ]; then
    echo "   ✓ Downloaded: $DEB_FILE"
    echo ""
    
    # Extract package contents
    echo "📦 Extracting package contents..."
    rm -rf antigravity-extracted
    dpkg-deb -x "$DEB_FILE" antigravity-extracted/
    
    # Look for version information
    echo "🔍 Searching for version/build ID information..."
    
    # Check common locations
    for file in \
        "antigravity-extracted/opt/Antigravity/resources/app/product.json" \
        "antigravity-extracted/opt/Antigravity/resources/app/package.json" \
        "antigravity-extracted/usr/share/antigravity/version" \
        "antigravity-extracted/opt/Antigravity/version"
    do
        if [ -f "$file" ]; then
            echo ""
            echo "📄 Found: $file"
            cat "$file" | grep -E "(version|build|commit)" || cat "$file"
        fi
    done
    
    # Try to find build ID in any file
    echo ""
    echo "🔎 Searching for build ID pattern..."
    BUILD_ID_SEARCH=$(find antigravity-extracted -type f -name "*.json" -o -name "version" -o -name "product.json" 2>/dev/null | \
        xargs grep -h -o '[0-9]\{16\}' 2>/dev/null | head -n1)
    
    if [ -n "$BUILD_ID_SEARCH" ]; then
        echo "   ✓ Possible Build ID: $BUILD_ID_SEARCH"
    fi
    
    # Clean up
    rm -rf antigravity-extracted "$DEB_FILE"
fi

echo ""
echo "✅ Fetch complete!"
