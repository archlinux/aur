#!/bin/bash
# paml-bin: single source (the release tarball bundles binaries + LICENSE/doc),
# so the checksum is refreshed with a single-line sed. Version detection uses the
# GitHub *releases/latest* API for consistency with raxml-ng-bin and to skip the
# aggregate `pre-v4.10` release. Note: the tag has a 'v' prefix (v4.10.10) but
# the asset filename does NOT (paml-4.10.10-linux-x86_64.tar.gz).
set -e

REPO="abacus-gene/paml"
URL="https://github.com/${REPO}"
PKGNAME="paml-bin"

echo "==> Checking for new version..."

LATEST_TAG=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep -oP '"tag_name": "\K[^"]+' | head -1)
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

# Tag carries the 'v' prefix, the asset filename does not.
TARBALL_URL="${URL}/releases/download/v${LATEST_VERSION}/paml-${LATEST_VERSION}-linux-x86_64.tar.gz"
echo "Downloading $TARBALL_URL..."
curl -sL "$TARBALL_URL" -o /tmp/paml-${LATEST_VERSION}.tar.gz

SHA256=$(sha256sum /tmp/paml-${LATEST_VERSION}.tar.gz | awk '{print $1}')
echo "SHA256: $SHA256"

rm -f /tmp/paml-${LATEST_VERSION}.tar.gz

echo "==> Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=('$SHA256')/" PKGBUILD

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Committing changes..."
git add PKGBUILD .SRCINFO
git commit -m "Update to version $LATEST_VERSION"

echo "==> Pushing to AUR..."
git push

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
