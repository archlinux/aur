#!/bin/bash
set -euxo pipefail

# Get channel
CHANNEL=$(awk -F '=' '/^_channel/{ print $2 }' PKGBUILD)
PKG="google-chrome-${CHANNEL}"

# Get latest version
VER=$(curl -sSf https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages |
	grep -A1 "Package: ${PKG}" |
	awk '/Version/{print $2}' |
	cut -d '-' -f1)

# Insert latest version into PKGBUILD and update hashes
sed -i \
	-e "s/^pkgver=.*/pkgver=${VER}/" \
	PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
	echo "Package ${PKG} has most recent version ${VER}"
	exit 0
fi

sed -i \
	-e 's/pkgrel=.*/pkgrel=1/' \
	PKGBUILD

updpkgsums

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO
