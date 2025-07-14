#!/bin/sh
if ! [ -d ov-client ]
then
	git clone "https://github.com/gisogrimm/ov-client.git"
fi
cd ov-client
git checkout master
git pull
make gitupdate
TAG=$(git describe --tags --candidates 1)
git checkout $TAG

VER=$(make -s ver | sed 's/\([^-]*\)-.*/\1/')
TAGVER=$(echo $TAG | sed 's/^v//;s/-.*$//')

if [ "$TAGVER" != "$VER" ]
then
	echo "Version mismatch! ($TAGVER vs $VER)"
	printf "please enter correct version: "
	read VER
fi

COMMIT=$(git show | grep -e "^commit" | sed 's/commit //' | sed 's/ .*$//')
echo "Moved to version $VER (tag $TAG) on commit $COMMIT"
cd ..
cat PKGBUILD | sed -e "s/pkgver=.*/pkgver=\"$VER\"/" | sed "s/git checkout -q .*/git checkout -q $COMMIT/"> PKGBUILD2
mv PKGBUILD2 PKGBUILD
makepkg --printsrcinfo > .SRCINFO
