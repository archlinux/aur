#!/bin/bash
set -e
set -o pipefail

echo "Fetching latest LycheeSlicer version from mango3d.io..."

# Fetch the download page and extract the version number from JSON data
LATEST_VERSION=$(curl -s "https://mango3d.io/download-lychee-slicer" | \
    grep -oP '\\\"version\\\":\\\"[0-9]+\.[0-9]+\.[0-9]+\\\"' | \
    head -1 | \
    sed 's/[^0-9.]//g')

if [ -z "$LATEST_VERSION" ]; then
    echo "Error: Could not fetch latest version from mango3d.io"
    echo "Please manually specify version: $0 <version>"
    exit 1
fi

# Allow manual override via command line argument
if [ -n "$1" ]; then
    LATEST_VERSION=$1
    echo "Using manually specified version: $LATEST_VERSION"
else
    echo "Latest version detected: $LATEST_VERSION"
fi

# Check if current version is already up to date
CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
    echo "Already up to date (current version: $CURRENT_VERSION)"
    exit 0
fi

echo "Updating from $CURRENT_VERSION to $LATEST_VERSION"

# Run the build and install script
./buildAndInstall.sh "$LATEST_VERSION"

# Commit and push changes
echo "Committing changes..."
git add PKGBUILD .SRCINFO

git commit -m "$LATEST_VERSION version"

echo "Pushing to remote..."
git push

echo "Done! Updated to version $LATEST_VERSION"
