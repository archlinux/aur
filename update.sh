#!/bin/sh
if [ "$(ls ov-client)" == "" ]
then
	git clone "https://github.com/gisogrimm/ov-client.git"
fi
cd ov-client
git checkout master
git pull
make gitupdate
VER=$(make -s ver | sed 's/\([^-]*\)-.*/\1/')
COMMIT=$(git show | grep -e "^commit" | sed 's/commit //' | sed 's/ .*$//')
echo "$COMMIT"
cd ..
cat PKGBUILD | sed -e "s/pkgver=.*/pkgver=\"$VER\"/" | sed "s/git checkout -q .*/git checkout -q $COMMIT/"> PKGBUILD2
mv PKGBUILD2 PKGBUILD
makepkg --printsrcinfo > .SRCINFO
