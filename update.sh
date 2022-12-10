#!/bin/sh
set -e

rm -rf *tar* src pkg *log*
updpkgsums
makepkg --printsrcinfo > .SRCINFO
rm -rf *tar* src pkg *log*
makepkg -C -f --noconfirm
git add .SRCINFO PKGBUILD
git commit -m "Bump pap"
git push
