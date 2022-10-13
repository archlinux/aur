#!/bin/bash
makepkg --printsrcinfo > .SRCINFO
source PKGBUILD && echo "pkgname=${pkgname}" && echo "pkgver=${pkgver}" && echo "pkgrel=${pkgrel}" 
echo
echo "git add -f" *PKGBUILD " .SRCINFO updates.sh"
echo 'git commit -m " "'
