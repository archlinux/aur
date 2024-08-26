#!/bin/bash
set -euxo pipefail

# Get latest version
VER=$(curl "https://dl.lazycat.cloud/client/desktop/lzc-client-desktop.tar.zst.metadata.json" --silent | awk -F '"' '/buildVersion/ {print $4}')

# Insert latest version into PKGBUILD and update hashes
sed -i \
	-e "s/^_pkgver=.*/_pkgver=${VER}/" \
	PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
	echo "Package has most recent version ${VER}"
	exit 0
fi

sed -i \
	-e 's/pkgrel=.*/pkgrel=1/' \
	PKGBUILD

updpkgsums

# Update .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "update ${VER}"
