#!/bin/bash
# Fetch Antigravity version information using distrobox
# This script runs on the host and calls into the distrobox
# Usage: ./fetch-antigravity-version.sh

set -e

DISTROBOX_NAME="antigravity-fetch"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Fetching Antigravity version via distrobox..."
echo ""

# Check if distrobox exists
if ! command -v distrobox &> /dev/null; then
    echo "❌ distrobox not found. Please install it first:"
    echo "   https://github.com/89luca89/distrobox"
    exit 1
fi

# Check if the antigravity-fetch distrobox exists
if ! distrobox list | grep -q "$DISTROBOX_NAME"; then
    echo "❌ Distrobox '$DISTROBOX_NAME' not found"
    echo ""
    echo "Create it with:"
    echo "   distrobox create --name $DISTROBOX_NAME --image debian:bookworm"
    echo ""
    read -p "Do you want to create it now? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "📦 Creating distrobox..."
        distrobox create --name "$DISTROBOX_NAME" --image debian:bookworm
        echo "   ✓ Distrobox created"
    else
        exit 1
    fi
fi

# Copy the fetch script into the distrobox (distrobox shares home by default)
# So the script is already accessible

# Run the fetch script inside distrobox
echo "🔄 Running fetch script in distrobox..."
echo ""

distrobox enter "$DISTROBOX_NAME" -- bash "$SCRIPT_DIR/distrobox-fetch-version.sh"

EXIT_CODE=$?

echo ""
if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ Version fetch completed successfully"
    echo ""
    echo "💡 Next steps:"
    echo "   1. Review the output above for version and build ID"
    echo "   2. If found, run: ./update-antigravity.sh <version> <buildid>"
else
    echo "❌ Version fetch failed"
    echo "   Check the errors above"
fi

exit $EXIT_CODE
