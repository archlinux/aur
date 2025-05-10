#!/bin/sh

makepkg --printsrcinfo >.SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "bumped version"
git push
