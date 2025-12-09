#!/bin/bash
# Check for new Antigravity versions
# This script attempts to discover new versions by probing known patterns
# Usage: ./check-version.sh

set -e

CURRENT_VERSION=$(grep '^pkgver=' PKGBUILD | cut -d'=' -f2)
CURRENT_BUILDID=$(grep '^_buildid=' PKGBUILD | cut -d'=' -f2)

echo "📦 Current version: ${CURRENT_VERSION} (build: ${CURRENT_BUILDID})"
echo "🔍 Checking for new versions..."
echo ""

# Function to check if a version+buildid combination exists
check_version() {
    local version=$1
    local buildid=$2
    local url="https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${version}-${buildid}/linux-x64/Antigravity.tar.gz"
    
    if curl --output /dev/null --silent --head --fail "$url" 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Parse current version
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

echo "🔎 Scanning for updates..."
echo "   (This may take a moment as we probe different build IDs...)"
echo ""

FOUND_NEWER=false
LATEST_VERSION="$CURRENT_VERSION"
LATEST_BUILDID="$CURRENT_BUILDID"

# Strategy: Check next patch versions with common build ID patterns
# Build IDs seem to be large numbers, we'll try incrementing from current

# Check next few patch versions
for patch_inc in {1..10}; do
    TEST_PATCH=$((PATCH + patch_inc))
    TEST_VERSION="${MAJOR}.${MINOR}.${TEST_PATCH}"
    
    # Try a range of build IDs (increment by ~100M from current)
    for buildid_offset in 0 100000000 200000000 500000000 1000000000; do
        TEST_BUILDID=$((CURRENT_BUILDID + buildid_offset))
        
        if check_version "$TEST_VERSION" "$TEST_BUILDID"; then
            echo "   ✓ Found: ${TEST_VERSION} (build: ${TEST_BUILDID})"
            FOUND_NEWER=true
            LATEST_VERSION="$TEST_VERSION"
            LATEST_BUILDID="$TEST_BUILDID"
            break 2  # Exit both loops on first find
        fi
    done
done

# Check next minor version
if [ "$FOUND_NEWER" = false ]; then
    NEXT_MINOR=$((MINOR + 1))
    TEST_VERSION="${MAJOR}.${NEXT_MINOR}.0"
    
    for buildid_offset in 0 100000000 200000000 500000000 1000000000; do
        TEST_BUILDID=$((CURRENT_BUILDID + buildid_offset))
        
        if check_version "$TEST_VERSION" "$TEST_BUILDID"; then
            echo "   ✓ Found: ${TEST_VERSION} (build: ${TEST_BUILDID}) - NEW MINOR VERSION!"
            FOUND_NEWER=true
            LATEST_VERSION="$TEST_VERSION"
            LATEST_BUILDID="$TEST_BUILDID"
            break
        fi
    done
fi

echo ""

if [ "$FOUND_NEWER" = true ]; then
    echo "🚨 UPDATE AVAILABLE!"
    echo ""
    echo "   Current: ${CURRENT_VERSION} (build: ${CURRENT_BUILDID})"
    echo "   Latest:  ${LATEST_VERSION} (build: ${LATEST_BUILDID})"
    echo ""
    echo "📋 To update, run:"
    echo "   ./update-antigravity.sh ${LATEST_VERSION} ${LATEST_BUILDID}"
else
    echo "✅ No updates found in scan range"
    echo ""
    echo "💡 Tips:"
    echo "   - Check https://antigravity.google/ for announcements"
    echo "   - Monitor the Debian repo for version info"
    echo "   - Build IDs are hard to predict - manual discovery may be needed"
fi

echo ""
echo "🔗 Alternative: Check Debian package version"
echo "   The Debian repo may have newer versions with build IDs"
echo "   Repo: https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/"
