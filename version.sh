#!/bin/bash
set -euo pipefail

# Update version fields in PKGBUILD from upstream Antigravity release API and refresh checksums.
PKGBUILD_PATH="${1:-PKGBUILD}"

if [[ ! -f "$PKGBUILD_PATH" ]]; then
    echo "Error: PKGBUILD not found: $PKGBUILD_PATH" >&2
    exit 1
fi

RELEASES_URL="https://antigravity-auto-updater-974169037036.us-central1.run.app/releases"
echo "Fetching latest version metadata..."
METADATA=$(curl -fsSL "$RELEASES_URL" | jq -r '.[0] | "\(.version) \(.execution_id)"')

read -r LATEST_VERSION LATEST_EXECUTION_ID <<< "$METADATA"

if [[ -z "$LATEST_VERSION" || -z "$LATEST_EXECUTION_ID" ]]; then
    echo "Error: Failed to fetch metadata from releases API" >&2
    exit 1
fi

CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_PATH" | cut -d= -f2)

echo "Current: $CURRENT_VERSION"
echo "Latest:  $LATEST_VERSION (execution_id=$LATEST_EXECUTION_ID)"

if [[ "$CURRENT_VERSION" == "$LATEST_VERSION" ]]; then
    CURRENT_ID=$(grep '^_execution_id=' "$PKGBUILD_PATH" | cut -d= -f2)
    if [[ "$CURRENT_ID" == "$LATEST_EXECUTION_ID" ]]; then
        echo "Already up to date."
        exit 0
    fi
fi

sed -i -E "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" "$PKGBUILD_PATH"
sed -i -E "s/^_execution_id=.*/_execution_id=${LATEST_EXECUTION_ID}/" "$PKGBUILD_PATH"
sed -i -E "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_PATH"

echo "Updating checksums (downloading both arch tarballs)..."
updpkgsums

echo "Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo ""
echo "Done! PKGBUILD and .SRCINFO updated to $LATEST_VERSION"
echo "Review with: git diff"
echo "Commit with: git add -A && git commit -m 'upgpkg: antigravity-hub-bin $LATEST_VERSION-1'"
echo "Push with:   git push"
