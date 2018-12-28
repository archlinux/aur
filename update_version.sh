#!/bin/bash
set -euxo pipefail

# Read pkg name
PKG=$(awk -F '=' '/pkgname=/{ print $2 }' PKGBUILD)

# Get latest version
VER=$(curl -sSfL "https://lv.luzifer.io/catalog-api/nerd-fonts/latest.txt?p=version")

# Insert latest version into PKGBUILD
sed -i \
	-e "s/^pkgver=.*/pkgver=${VER}/" \
	-e 's/pkgrel=.*/pkgrel=1/' \
	PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
	echo "Package ${PKG} has most recent version ${VER}"
	exit 0
fi

# Update source hashes
updpkgsums

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "${PKG} v${VER}"
