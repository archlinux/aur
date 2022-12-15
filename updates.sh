#!/bin/bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "don't forget to increment pkgrel if you edited the PKGBUILD"
source PKGBUILD && echo "pkgver=${pkgver}" && echo "pkgrel=${pkgrel}"
echo
echo "git add -f  PKGBUILD  .SRCINFO " *.sh
echo 'git commit -m " "'
