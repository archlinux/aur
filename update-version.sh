#!/bin/sh -e
#
# Update the PKGBUILD with the lastest release

VERSIONURL="https://get.please.build/latest_version"
VERSION=`curl -fsSL ${VERSIONURL}`
SHA256SUMURL="https://github.com/thought-machine/please/releases/download/v${VERSION}/please_${VERSION}_linux_amd64.tar.gz.sha256"

SHA256SUM=`curl -fsSL ${SHA256SUMURL} | cut -d ' ' -f1`

sed -i -e "s/pkgver=.*/pkgver=${VERSION}/" PKGBUILD
sed -i -e "s/sha256sums_x86_64=.*/sha256sums_x86_64=(\"${SHA256SUM}\")/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO

git commit -m "Updating to ${VERSION}" ./PKGBUILD ./.SRCINFO
