#!/usr/bin/env fish

makepkg --printsrcinfo >.SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "bumped version"
git push
