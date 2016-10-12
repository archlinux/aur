#!/bin/bash

newver=$1
oldver=$(grep -a "pkgver=" PKGBUILD | sed 's/pkgver=//g')
echo "New version number is $newver."
echo "Old version was $oldver."

oldrel=$(grep -a "pkgrel=" PKGBUILD | sed 's/pkgrel=//g')

if [ $newver != $oldver ]; then
  echo "Version number has changed."
  sed -i "4s/.*/pkgver=$newver/" PKGBUILD
  if [ $oldrel != 1 ]; then
    echo "Resetting release to 1."
    sed -i "5s/.*/pkgrel=1/" PKGBUILD
  fi
  sed -i "15s/.*/$(makepkg --geninteg)/" PKGBUILD
fi

makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD
git add .SRCINFO
git commit -m 'automated version bump'
git push
