#!/bin/bash
# Semi-automated Antigravity update script
# Usage: ./update-antigravity.sh <new_version> <new_buildid>
# Example: ./update-antigravity.sh 1.11.10 4800000000000000

set -e

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <new_version> <new_buildid>"
    echo "Example: $0 1.11.10 4800000000000000"
    echo ""
    echo "💡 To find the build ID:"
    echo "   1. Check https://antigravity.google/ for announcements"
    echo "   2. Try the Debian package metadata"
    echo "   3. Use ./check-version.sh to probe for it"
    exit 1
fi

NEW_VERSION="$1"
NEW_BUILDID="$2"
DOWNLOAD_URL="https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${NEW_VERSION}-${NEW_BUILDID}/linux-x64/Antigravity.tar.gz"

echo "🚀 Updating antigravity-bin-hardened to version ${NEW_VERSION}"
echo "   Build ID: ${NEW_BUILDID}"
echo ""

# Verify the URL exists before proceeding
echo "🔍 Verifying download URL..."
if ! curl --output /dev/null --silent --head --fail "$DOWNLOAD_URL"; then
    echo "❌ ERROR: Could not verify download URL"
    echo "   URL: $DOWNLOAD_URL"
    echo ""
    echo "   The version or build ID may be incorrect."
    echo "   Please double-check the values."
    exit 1
fi
echo "   ✓ URL verified"
echo ""

# Clean old downloads
echo "📦 Cleaning old files..."
rm -f Antigravity.tar.gz Antigravity-*.tar.gz

# Download new file
echo "⬇️  Downloading new version..."
curl -L -o "Antigravity.tar.gz" "$DOWNLOAD_URL"

# Calculate checksum
echo ""
echo "🔐 Calculating BLAKE2b checksum..."
CHECKSUM=$(b2sum "Antigravity.tar.gz" | awk '{print $1}')

echo "Tarball: $CHECKSUM"
echo ""

# Update PKGBUILD
echo "📝 Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=${NEW_VERSION}/" PKGBUILD
sed -i "s/^_buildid=.*/_buildid=${NEW_BUILDID}/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

# Update checksum in PKGBUILD
# Antigravity has 4 checksums: tarball + 3 local files
awk -v checksum="$CHECKSUM" '
/^b2sums=/ {
    print "b2sums=('\''" checksum "'\''";
    # Skip the old first checksum
    getline;
    # Print the rest (local files - should be 3 more)
    while (getline && !/^[a-z]/) {
        print;
    }
    # Print the line that broke the loop
    if (NF > 0) print;
    next;
}
{print}
' PKGBUILD > PKGBUILD.tmp && mv PKGBUILD.tmp PKGBUILD

# Regenerate .SRCINFO
echo "🔄 Regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

# Test build
echo ""
echo "🔨 Testing build..."
rm -rf src/ pkg/
if makepkg -f; then
    echo ""
    echo "✅ Build successful!"
    echo ""
    echo "📋 Next steps:"
    echo "   1. Review changes: git diff"
    echo "   2. Commit: git add PKGBUILD .SRCINFO && git commit -m 'upgpkg: antigravity-bin-hardened ${NEW_VERSION}-1"
    echo ""
    echo "Upstream release ${NEW_VERSION}'"
    echo "   3. Push: git push"
    # Cleanup big files
    rm -rf src/ pkg/ *.tar.gz *.zip *.deb *.binAntigravity.tar.gz Antigravity-*.tar.gz
else
    echo ""
    echo "❌ Build failed! Please review the errors above."
    # Cleanup on fail too to save space? Optional.
    # rm -rf src/ pkg/
    exit 1
fi
