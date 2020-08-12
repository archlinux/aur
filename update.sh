#!/bin/bash

#stop on failure
set -e

pkgrel=$(grep pkgrel PKGBUILD | cut -d '=' -f 2)
if [ "$pkgrel" != "1" ]; then
  echo "pkgrel is $pkgrel, not 1. Continue?"
  read -q
fi

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
