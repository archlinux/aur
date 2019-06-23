#!/bin/sh
#
# Update the PKGBUILD with the lastest release

VERSION=`curl -fsSL https://get.please.build/latest_version`
SHA256URL="https://get.please.build/linux_amd64/${VERSION}/please_${VERSION}.tar.gz.sha256"

SHA256SUM=`curl -fsSL ${SHA256URL} | cut -d ' ' -f1`

sed -i -e "s/pkgver=.*/pkgver=${VERSION}/" PKGBUILD
sed -i -e "s/sha256sums_x86_64=.*/sha256sums_x86_64=(\"${SHA256SUM}\")/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO

git commit -m "Updating to ${VERSION}" ./PKGBUILD ./.SRCINFO
