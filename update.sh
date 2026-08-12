#!/bin/bash
# raxml-ng-bin: single source (the release zip bundles the binary + LICENSE.txt),
# so the checksum is refreshed with a single-line sed. Version detection uses the
# GitHub *releases/latest* API rather than the tags endpoint, because raxml-ng's
# tags list is polluted with non-version tags (supermuc-benchmark-1, repro-v0.3…).
set -e

REPO="amkozlov/raxml-ng"
URL="https://github.com/${REPO}"
PKGNAME="raxml-ng-bin"

echo "==> Checking for new version..."

# releases/latest, NOT tags — the tags list carries non-version entries.
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

# The git tag has NO 'v' prefix, but the asset filename does (raxml-ng_vX.Y.Z_...).
TARBALL_URL="${URL}/releases/download/${LATEST_VERSION}/raxml-ng_v${LATEST_VERSION}_linux_x86_64.zip"
echo "Downloading $TARBALL_URL..."
curl -sL "$TARBALL_URL" -o /tmp/raxml-ng_v${LATEST_VERSION}.zip

SHA256=$(sha256sum /tmp/raxml-ng_v${LATEST_VERSION}.zip | awk '{print $1}')
echo "SHA256: $SHA256"

rm -f /tmp/raxml-ng_v${LATEST_VERSION}.zip

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
