#!/bin/bash
set -euxo pipefail

date --iso-8601=seconds

# Get latest version
VER=$(curl "https://dl.lazycat.cloud/client/desktop/lzc-client-desktop.tar.zst.metadata.json" --silent | awk -F '"' '/buildVersion/ {print $4}')
MD5=$(curl "https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_${VER}.tar.zst.md5" --silent)

# Insert latest version into PKGBUILD and update hashes
sed -i -e "s/^_pkgver=.*/_pkgver=${VER}/" PKGBUILD
sed -i -e "s/^md5sums=.*/md5sums=('${MD5}'/" PKGBUILD

# Check whether this changed anything
if (git diff --exit-code PKGBUILD); then
	echo "Package has most recent version ${VER}"
	exit 0
fi

sed -i \
	-e 's/pkgrel=.*/pkgrel=1/' \
	PKGBUILD

# Update .SRCINFO
if command -v printsrcinfo > /dev/null; then
  printsrcinfo > .SRCINFO
else
  makepkg --printsrcinfo > .SRCINFO
fi

# Commit changes
git add PKGBUILD .SRCINFO
git commit -m "update ${VER}"
git push
