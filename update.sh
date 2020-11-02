#/bin/bash

gem2arch --no-git --no-aur --no-install mdless
cp ruby-mdless/PKGBUILD PKGBUILD
makepkg --printsrcinfo > .SRCINFO
rm -rf ruby-mdless
