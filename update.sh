#!/bin/bash
# deeptools: NO source array — package() fetches deepTools==$pkgver (plus pysam,
# pyBigWig, py2bit, deeptoolsintervals) from PyPI at install time via
# `uv pip install`. So there are NO checksums to refresh; only pkgver/pkgrel.
# Version detection uses the PyPI JSON API.
set -e

PKGNAME="deeptools"
PYPI="https://pypi.org/pypi/deeptools/json"

echo "==> Checking for new version..."

LATEST_VERSION=$(curl -s "$PYPI" | grep -oP '"version": "\K[^"]+' | head -1)

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

# Sourceless recipe: package() pulls deepTools==$pkgver straight from PyPI,
# so only pkgver/pkgrel change — no source, no sha256sums to refresh.
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Committing changes..."
git add PKGBUILD .SRCINFO
git commit -m "Update to version $LATEST_VERSION"

echo "==> Pushing to AUR..."
git push

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
