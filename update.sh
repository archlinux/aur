#!/bin/bash

# Update files
perl -pi -e "s/pkgver=\\d+\\.\\d+\\.\\d+/pkgver=$1/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Push
git add PKGBUILD .SRCINFO
makepkg -si --noconfirm &
git commit -m "Update to $1"
git push

