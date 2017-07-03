#!/usr/bin/bash

# get last pkgver
pkgver=$(curl -s https://hg.mozilla.org/releases/mozilla-beta/tags | grep -Eo ">FIREFOX_.*_.*_RELEASE<" -m1  | awk -F'_' '{print $2"."$3}')
echo "last FF-dev release: ${pkgver}"
sed -i -e "s/pkgver=.*/pkgver=${pkgver}/" ./PKGBUILD

#makepkg -g -f -p PKGBUILD
updpkgsums

makepkg --printsrcinfo >.SRCINFO

makepkg -scf
