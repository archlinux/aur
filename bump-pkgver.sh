#!/bin/bash

set -e

makepkg -sf
pkgver=$(grep "pkgver=" PKGBUILD | cut -d = -f 2)
makepkg --printsrcinfo > .SRCINFO
git add .SRCINFO PKGBUILD
git status
echo "Do you want to commit and push these stages changes? (Enter to confirm, Ctrl+C to abort)"
read
git commit -m "Bump to $pkgver"
git push
