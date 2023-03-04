#!/usr/bin/env bash

# Update the package when new versions are pushed

makepkg -f
makepkg --printsrcinfo > .SRCINFO

pkgver=$(grep "pkgver" .SRCINFO | cut -f2 -d= | sed 's/[^.a-z0-9]*//g')

if [[ `git status --porcelain` ]]; then
    echo "$(date --utc +'%Y-%m-%d %H:%M:%S') New version built: $pkgver" | tee -a update.log
    git add PKGBUILD .SRCINFO
    git commit -m "Update to version $pkgver"
    git push aur master
else
    echo "$(date --utc +'%Y-%m-%d %H:%M:%S') Still version $pkgver" | tee -a update.log
fi
