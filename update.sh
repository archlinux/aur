#!/bin/sh
git clean -fd
rm .SRCINFO
emacs PKGBUILD
makepkg
makepkg makepkg --printsrcinfo > .SRCINFO
git clean -fd
git commit -a
git push
