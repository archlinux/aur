#!/bin/bash
set -e

# Fetch latest version from GitHub API
VERSION=$(curl -sL https://api.github.com/repos/sparrowwallet/sparrow/releases/latest | jq -r .tag_name | sed 's/^v//')
echo "Latest version: $VERSION"

# Extract current version from PKGBUILD
CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
echo "Current version: $CURRENT_VERSION"

# Check if update is necessary
if [ "$VERSION" = "$CURRENT_VERSION" ]; then
    echo "Package sparrow-wallet already has the latest version $VERSION"
    exit 0  # No update needed, but not an error
fi

echo "Updating from $CURRENT_VERSION to $VERSION"

# Update version in PKGBUILD
sed -i -e "s/pkgver=.*/pkgver=$VERSION/" PKGBUILD

# Reset pkgrel to 1 if version changed
if [ "$VERSION" != "$CURRENT_VERSION" ]; then
    sed -i -e "s/pkgrel=.*/pkgrel=1/" PKGBUILD
    echo "Reset pkgrel to 1"
fi

# Update checksums
updpkgsums

# Check if anything actually changed
if git diff --exit-code PKGBUILD &>/dev/null; then
    echo "No changes detected in PKGBUILD"
    exit 0  # No changes, but not an error
fi

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "feat: update to v${VERSION}"

echo "Successfully updated to version $VERSION"
# Exit 0 indicates changes were made and committed
