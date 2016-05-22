#! /bin/bash

sed -i "5s/.*/pkgver=`git ls-remote http://www.github.com/markubiak/wallpaper-reddit.git HEAD | cut -f 1`/" PKGBUILD
makepkg --printsrcinfo > .SRCINFO
git add --all
git commit -m "update to latest commit"
git push
