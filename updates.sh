#!/bin/bash
updpkgsums
echo "creating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
echo "don't forget to increment pkgrel if you edited the PKGBUILD"
source PKGBUILD && echo "pkgver=${pkgver}" && echo "pkgrel=${pkgrel}"
echo
echo "git add -f PKGBUILD .SRCINFO updates.sh"
echo 'git commit -m " "'
