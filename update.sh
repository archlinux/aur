#!/bin/bash
set -e

URL_BASE="https://ftp.ncbi.nlm.nih.gov"
REL_PATH="blast/executables/magicblast"
PKGNAME="magicblast"

echo "==> Checking for new version..."
LATEST_VERSION=$(curl -s "$URL_BASE/$REL_PATH/" | grep -oP 'href="\K[0-9][0-9.]+' | sort -V | tail -1)

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
TARBALL_URL="$URL_BASE/$REL_PATH/$LATEST_VERSION/ncbi-magicblast-$LATEST_VERSION-x64-linux.tar.gz"
echo "Downloading $TARBALL_URL..."
curl -sL "$TARBALL_URL" -o /tmp/$PKGNAME-$LATEST_VERSION.tar.gz

SHA256=$(sha256sum /tmp/$PKGNAME-$LATEST_VERSION.tar.gz | awk '{print $1}')
echo "SHA256: $SHA256"
rm -f /tmp/$PKGNAME-$LATEST_VERSION.tar.gz

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
