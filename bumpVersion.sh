#! /bin/env bash

set -euo pipefail

UPSTREAM_VERSION=$(curl -Ls https://dev.monetdb.org/downloads/sources/Latest/ | grep -o 'href="MonetDB-..\..*\..*\.tar\.xz"' |  sed 's/href="MonetDB-//' | sed 's/.tar.xz"$//')
CURRENT_VERSION=$(grep -o 'pkgver=.*' PKGBUILD | cut -c 8-)

if [[ "$UPSTREAM_VERSION" == "$CURRENT_VERSION" ]]; then
	echo "current version $CURRENT_VERSION is up to date";
	exit;
fi

echo "bumping version: $CURRENT_VERSION -> $UPSTREAM_VERSION"

SHA256SUM=$(curl -Ls https://dev.monetdb.org/downloads/sources/archive/SHA256SUM | grep "MonetDB-$UPSTREAM_VERSION\.tar\.xz" | cut -f 1 -d ' ')

# update pkgver and sha256sum
sed -i "s/^pkgver=$CURRENT_VERSION$/pkgver=$UPSTREAM_VERSION/g" PKGBUILD
sed -i "s/^sha256sums=('.*')$/sha256sums=('$SHA256SUM')/g" PKGBUILD

# update SRCINFO
makepkg --printsrcinfo > .SRCINFO

# test if it builds
makepkg -f 2> /dev/null

git commit PKGBUILD .SRCINFO -m "Update to $UPSTREAM_VERSION"

echo "updated PKGBUILD for MonetDB $UPSTREAM_VERSION. Don't forget to"
echo "git push"
