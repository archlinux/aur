#!/bin/sh

if [[ $# -ne 1 ]]
then
  echo "Usage: './auto-update.sh <version>"
  echo "For example: './auto-update.sh 8.0.1415"
  exit 0
fi

VERSION=$1

echo "Auto-updating version $VERSION..."

echo "Generating a new PKGBUILD"
cp PKGBUILD.template PKGBUILD
sed -i "s/__VERSION__/$VERSION/g" PKGBUILD

echo "Updating the checksum"
updpkgsums

echo "Updating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

echo "Commit files"
git add .SRCINFO PKGBUILD
git commit --author "ncoif <ncoif@gmx.com>" -m "vim-runtime version $VERSION"

echo "clean-up"
rm -v vim-$VERSION.tar.gz
