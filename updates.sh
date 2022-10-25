#!/bin/bash
echo "creating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
source PKGBUILD && echo "pkgver=${pkgver}" && echo "pkgrel=${pkgrel}"
echo
echo "git add -f" *PKGBUILD " .SRCINFO updates.sh"
echo 'git commit -m " "'
