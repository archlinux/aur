#!/bin/bash
# Rewriter: takes the new upstream version as $1; version detection lives in
# the root nvchecker.toml.
# Maintainer-side tool, never executed during package build or install.
set -e
[ $# -eq 1 ] || { echo "usage: $0 <new-version>" >&2; exit 1; }
LATEST_VERSION=${1#v}

REPO_URL="https://github.com/imjiaoyuan/jsrc"
PKGNAME="jsrc"
CURRENT_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $LATEST_VERSION"

echo "==> Updating to version $LATEST_VERSION..."

TARBALL_URL="$REPO_URL/archive/v$LATEST_VERSION.tar.gz"
echo "Downloading $TARBALL_URL..."
curl -sL "$TARBALL_URL" -o /tmp/jsrc-$LATEST_VERSION.tar.gz

SHA256=$(sha256sum /tmp/jsrc-$LATEST_VERSION.tar.gz | awk '{print $1}')
echo "SHA256: $SHA256"

rm -f /tmp/jsrc-$LATEST_VERSION.tar.gz

echo "==> Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=('$SHA256')/" PKGBUILD

NEW_VERSION=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
if [ "$NEW_VERSION" = "$CURRENT_VERSION" ]; then
    echo "==> No version change; discarding edits."
    git checkout -- PKGBUILD
    exit 0
fi

echo "==> Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo "==> Done! Updated from $CURRENT_VERSION to $LATEST_VERSION"
