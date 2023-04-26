#!/bin/bash

VERSION="$1"

if [ -z "$VERSION" ]
then
	echo Please provide version number as first argument to the script
	exit 1
fi

echo == Cleaning up things...
rm -rf pkg
rm -rf src
rm -f killer-vpn-*.tar.gz
rm -f killer-vpn-*.zst

echo == Changing pkgver in PKGBUILD...
sed -i "s/^pkgver=.*$/pkgver=$VERSION/" PKGBUILD

echo == Downloading source to compute SHA256...
touch install.sh # Need to do this in case it doesn't exist
makepkg --verifysource --skipchecksums
SHA256=$(sha256sum killer-vpn-${VERSION}.tar.gz | awk '{print $1}')
echo SHA256=$SHA256

echo == Changing sha256sums in PKGBUILD...
sed -i "s/^sha256sums=.*$/sha256sums=\(\"${SHA256}\"\)/" PKGBUILD

echo == Updating PKGBUILD and install.sh...
tar xvf killer-vpn-${VERSION}.tar.gz
mv killer-vpn/arch/install.sh .

#rm -rf killer-vpn-${VERSION}      # GitHub adds version to tar's internal folder
rm -rf killer-vpn                  # Codeberg doesn't

echo == Checking package build...
if ! makepkg -frs
then
	echo
	echo "PACKAGE BUILD FAILED !!!"
	echo
	exit 1
fi

echo == Generating .SRCINFO file...
makepkg --printsrcinfo > .SRCINFO

echo == Creating release commit...
git add .
git commit -m "release $VERSION"

echo
echo The release commit is ready.
echo Please check that it is correct, then run 'git push' when ready
echo
