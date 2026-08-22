#!/bin/bash
# Rewriter: takes the new upstream version as $1; version detection lives in
# the root nvchecker.toml. Tags are v<ver> and the raw tag is kept in _tag.
# Maintainer-side tool, never executed during package build or install.
set -e
[ $# -eq 1 ] || { echo "usage: $0 <new-version>" >&2; exit 1; }
LATEST_VERSION=${1#v}
LATEST_TAG="v$LATEST_VERSION"

REPO="steineggerlab/foldcomp"
PKGNAME="foldcomp"
CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $LATEST_VERSION"

echo "==> Updating to version $LATEST_VERSION..."

TARBALL_URL="https://github.com/${REPO}/archive/${LATEST_TAG}.tar.gz"
echo "Downloading $TARBALL_URL..."
curl -sL "$TARBALL_URL" -o /tmp/$PKGNAME-$LATEST_TAG.tar.gz

SHA256=$(sha256sum /tmp/$PKGNAME-$LATEST_TAG.tar.gz | awk '{print $1}')
echo "SHA256: $SHA256"

rm -f /tmp/$PKGNAME-$LATEST_TAG.tar.gz

echo "==> Updating PKGBUILD..."
sed -i "s/^_tag=.*/_tag=$LATEST_TAG/" PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=('$SHA256')/" PKGBUILD

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
