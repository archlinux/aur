#!/bin/sh

PKGBUILD_VERSION=$(cat PKGBUILD | grep 'pkgver=' | cut -d'=' -f2)
echo "Current PKGBUILD version:"
echo $PKGBUILD_VERSION

VERSION_RAW=$(curl --silent https://api.github.com/repos/metabase/metabase/releases/latest | jq -r '.tag_name')
echo "Latest Metabase version:"
echo $VERSION_RAW
VERSION=${VERSION_RAW:1}
echo $VERSION

if [ $PKGBUILD_VERSION != $VERSION ]; then
	echo "Newer version found, starting download"
	curl -O https://downloads.metabase.com/latest/metabase.jar
	
	sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
        #makepkg
        #CHKSUM="$(sha512sum metabase.jar | cut -d' ' -f1)"
        #sed -i "s/^sha512sums=.*/sha512sums=('$CHKSUM')/;s/^pkgrel=.*/pkgrel=1/" PKGBUILD
        #makepkg
	CHKSUM="$(b2sum metabase.jar | cut -d' ' -f1)"
	echo $CHKSUM

	echo "Press enter to continue, copy the b2sum and paste in PKGBUILD"
        read
	vim PKGBUILD
        makepkg --printsrcinfo > .SRCINFO

	echo "Ready to commit?"
	read
        git add .SRCINFO PKGBUILD
        git commit -m "Updated to $VERSION"
        git push
fi
