#!/bin/bash
# Complete Antigravity update workflow using distrobox
# This script fetches version info and optionally updates the package
# Usage: ./auto-update-antigravity.sh [--auto]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AUTO_MODE=false

if [ "$1" = "--auto" ]; then
    AUTO_MODE=true
fi

echo "🚀 Antigravity Auto-Update Workflow"
echo "===================================="
echo ""

# Step 1: Fetch version from Debian repo
echo "📦 Step 1: Fetching version from Debian repository..."
echo ""

if ! "$SCRIPT_DIR/fetch-antigravity-version.sh"; then
    echo ""
    echo "❌ Failed to fetch version information"
    exit 1
fi

echo ""
echo "===================================="
echo ""

# Step 2: Parse the output (this is tricky - we need to capture it)
# Let's re-run just the distrobox part and capture output
echo "📊 Step 2: Parsing version information..."
echo ""

VERSION_OUTPUT=$(distrobox enter antigravity-fetch -- bash -c "apt-cache policy antigravity 2>/dev/null | grep 'Candidate:' | awk '{print \$2}'" 2>/dev/null || echo "")

if [ -z "$VERSION_OUTPUT" ]; then
    echo "❌ Could not parse version from Debian repo"
    echo ""
    echo "💡 Manual steps:"
    echo "   1. Run: ./fetch-antigravity-version.sh"
    echo "   2. Note the version and build ID from output"
    echo "   3. Run: ./update-antigravity.sh <version> <buildid>"
    exit 1
fi

echo "   Debian version: $VERSION_OUTPUT"

# Extract just the version number (remove any debian revision like -1)
NEW_VERSION=$(echo "$VERSION_OUTPUT" | cut -d'-' -f1)
echo "   Antigravity version: $NEW_VERSION"

# Get current version
CURRENT_VERSION=$(grep '^pkgver=' PKGBUILD | cut -d'=' -f2)
echo "   Current PKGBUILD version: $CURRENT_VERSION"
echo ""

# Compare versions
if [ "$NEW_VERSION" = "$CURRENT_VERSION" ]; then
    echo "✅ Package is already up to date!"
    exit 0
fi

echo "🚨 Update available: $CURRENT_VERSION → $NEW_VERSION"
echo ""

# Step 3: Try to find build ID
echo "🔍 Step 3: Searching for build ID..."
echo ""

# This requires downloading and inspecting the package
# We'll need to parse the previous fetch output or re-fetch
echo "   Attempting to extract build ID from Debian package..."

BUILD_ID=$(distrobox enter antigravity-fetch -- bash -c "
    cd /tmp
    rm -f antigravity_*.deb
    apt download antigravity 2>/dev/null >/dev/null
    DEB_FILE=\$(ls -t antigravity_*.deb 2>/dev/null | head -n1)
    if [ -n \"\$DEB_FILE\" ]; then
        dpkg-deb -x \"\$DEB_FILE\" antigravity-extracted/ 2>/dev/null
        find antigravity-extracted -type f \( -name '*.json' -o -name 'version' \) 2>/dev/null | \
            xargs grep -h -o '[0-9]\{16\}' 2>/dev/null | head -n1
        rm -rf antigravity-extracted \"\$DEB_FILE\"
    fi
" 2>/dev/null || echo "")

if [ -z "$BUILD_ID" ]; then
    echo "   ⚠️  Could not automatically extract build ID"
    echo ""
    echo "❌ Build ID required for update"
    echo ""
    echo "📋 Manual steps:"
    echo "   1. Check the fetch output above for build ID"
    echo "   2. Or visit https://antigravity.google/ for release info"
    echo "   3. Then run: ./update-antigravity.sh $NEW_VERSION <buildid>"
    exit 1
fi

echo "   ✓ Found Build ID: $BUILD_ID"
echo ""

# Step 4: Update
echo "===================================="
echo ""
echo "📦 Step 4: Updating package..."
echo ""

if [ "$AUTO_MODE" = true ]; then
    echo "   Running in AUTO mode - proceeding with update"
    "$SCRIPT_DIR/update-antigravity.sh" "$NEW_VERSION" "$BUILD_ID"
else
    echo "   Version: $NEW_VERSION"
    echo "   Build ID: $BUILD_ID"
    echo ""
    read -p "Proceed with update? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        "$SCRIPT_DIR/update-antigravity.sh" "$NEW_VERSION" "$BUILD_ID"
    else
        echo ""
        echo "Update cancelled. To update manually, run:"
        echo "   ./update-antigravity.sh $NEW_VERSION $BUILD_ID"
    fi
fi
