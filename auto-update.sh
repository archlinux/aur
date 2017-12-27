#!/bin/sh

if [[ $# -ne 1 ]]
then
  echo "Usage: './auto-update.sh <version>"
  exit 0
fi

VERSION=$1

echo "Auto-updating version $VERSION..."

echo "Downloading new package..."
wget https://github.com/vim/vim/archive/v$VERSION.tar.gz

SHA1SUM=`sha1sum v$VERSION.tar.gz | awk '{ print $1 }'`
echo "sha1sum is $SHA1SUM"

echo "Generate new PKGBUILD"
cp PKGBUILD.template PKGBUILD
sed -i "s/__VERSION__/$VERSION/g" PKGBUILD
sed -i "s/__SHA1SUM__/$SHA1SUM/g" PKGBUILD

echo "Updating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

echo "Commit files"
git add .SRCINFO PKGBUILD
git commit -m "vim-runtime version $VERSION"

echo "clean-up"
rm -v v$VERSION.tar.gz
