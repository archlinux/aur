#!/bin/bash
updpkgsums 
source PKGBUILD
rm v${pkgver}.tar.gz
makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "$1"
git push
