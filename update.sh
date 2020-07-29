#!/bin/bash

#stop on failure
set -e

echo "Updating to verion $1"
sed -i -e "s/pkgver=.*/pkgver=$1/g" PKGBUILD

echo "Updating checksums"
updpkgsums

echo "Updating SRCINFO"
makepkg --printsrcinfo > .SRCINFO

echo "Commiting changes"
git add PKGBUILD .SRCINFO
git commit -m "Update to version $1"
git clean -d -f 

echo "Pushing changes"
git push

echo "Update Complete :)"
