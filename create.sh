#!/bin/bash
if [[ ! $# -eq "2" ]]; then
	echo "Usage:"
	echo "$0 version version_postfix"
	exit 1
fi

rm -v TerasologyOmega.zip{,.part}
rm -rv src/

echo "Setting version to $1"
sed -i "s/_version=.*/_version=$1/g" PKGBUILD

echo "Setting version postfix to $2"
sed -i "s/_verson_postfix=.*/_version_postfix=$2/g" PKGBUILD

echo updpkgsums
updpkgsums
chmod -v 644 PKGBUILD
makepkg
makepkg --printsrcinfo > .SRCINFO
