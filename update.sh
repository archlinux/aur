#!/bin/bash
# ORFfinder ships an unversioned gzipped binary; the version is read from the
# upstream CHANGELOG.txt (newest entry first).
set -e

URL="https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/linux-i64/ORFfinder.gz"
CHANGELOG="https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/ORFfinder/CHANGELOG.txt"
PKGNAME="orffinder"

echo "==> Checking for new version..."
LATEST_VERSION=$(curl -s "$CHANGELOG" | grep -oP '(?<=- v )\d+\.\d+\.\d+' | head -1)

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
SHA256=$(curl -sL "$URL" | sha256sum | awk '{print $1}')
echo "SHA256: $SHA256"

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
