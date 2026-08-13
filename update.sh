#!/bin/bash
# autocycler-bin has two sources (binary tarball + LICENSE), so checksums are
# refreshed with `updpkgsums` (pacman-contrib) instead of a single-line sed.
set -e

REPO="rrwick/Autocycler"
URL="https://github.com/${REPO}"
PKGNAME="autocycler-bin"

echo "==> Checking for new version..."

LATEST_URL=$(curl -sILo /dev/null -w '%{url_effective}' "https://github.com/${REPO}/releases/latest")
LATEST_TAG=${LATEST_URL##*/}
LATEST_VERSION=${LATEST_TAG#v}

if [ -z "$LATEST_VERSION" ]; then
    echo "Error: Could not fetch latest version"
    exit 1
fi

CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)

echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $LATEST_VERSION"

if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
    echo "==> Already up to date!"
    exit 0
fi

echo "==> Updating to version $LATEST_VERSION..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo "==> Updating checksums (requires pacman-contrib)..."
updpkgsums

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Committing changes..."
git add PKGBUILD .SRCINFO
git commit -m "Update to version $LATEST_VERSION"

echo "==> Pushing to AUR..."
git push

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
