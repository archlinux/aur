#!/bin/bash
set -euxo pipefail

PKG="deepin-wine-helper"
REPO="https://community-store-packages.deepin.com/appstore/dists/eagle/appstore/binary-i386/Packages"

# Get latest version
VER=$(curl -sSf ${REPO} |
	grep -A13 "Package: ${PKG}" |
	awk '/Version/{print $2}')

# Insert latest version into PKGBUILD and update hashes
sed -i \
	-e "s/^_pkgver=.*/_pkgver=${VER}/" \
	PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
	echo "Package ${PKG} has most recent version ${VER}"
	exit 0
fi

updpkgsums

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "${PKG} v${VER}"
