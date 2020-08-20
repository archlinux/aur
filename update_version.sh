#!/bin/bash
set -euxo pipefail

PKG=$(awk -F '=' '/^pkgname=/{ print $2 }' PKGBUILD)

# Get latest version
VER=$(git ls-remote --tags --sort -v:refname https://github.com/librespeed/speedtest-cli.git |
	head -n1 |
	grep -Eo '[0-9.]+$')

# Insert latest version into PKGBUILD and update hashes
sed -i \
	-e "s/^pkgver=.*/pkgver=${VER}/" \
	-e 's/pkgrel=.*/pkgrel=1/' \
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
