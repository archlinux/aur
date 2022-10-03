#!/bin/bash
set -euxo pipefail

# Get latest version
VER=$(pacman -Si dolphin | grep Version | sed -E 's@^.*: ([0-9]+\.[0-9]+(\.[0-9]+)?)-[0-9]+.*@\1@')

# Insert latest version into PKGBUILD and update hashes
sed -i \
	-e "s/^pkgver=.*$/pkgver=${VER}/" \
	PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
	echo "Package already has most recent version: ${VER}"
	exit 0
fi

sed -i \
	-e 's/pkgrel=.*/pkgrel=1/' \
	PKGBUILD

updpkgsums

# Update .SRCINFO
makepkg --printsrcinfo >| .SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "v${VER}"
