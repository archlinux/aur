#!/bin/sh

makepkg -f &&
makepkg --printsrcinfo > .SRCINFO &&
git add PKGBUILD .SRCINFO &&
git commit -m "Updated to version $(makepkg --printsrcinfo | grep pkgver | cut -d ' ' -f 3)" &&
git push
