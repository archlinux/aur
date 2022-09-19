#!/bin/bash
echo "updating checksums for PKGBUILDs"
updpkgsums
 updpkgsums cc.dev.PKGBUILD
updpkgsums deb.PKGBUILD
echo "creating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
#sha256sum skywire-scripts.tar.gz
echo "don't forget to increment pkgrel if you edited the PKGBUILD"
source PKGBUILD && echo "pkgver=${pkgver}" && echo "pkgrel=${pkgrel}"
echo
echo "git add -f cc.dev.PKGBUILD deb.PKGBUILD PKGBUILD .SRCINFO updates.sh"
echo 'git commit -m " "'
