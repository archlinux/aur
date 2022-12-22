#!/bin/bash
source PKGBUILD
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
echo ${_version}
echo "updating checksums and version for PKGBUILDs"
sed -i "s/^pkgver=.*/pkgver='${_version}'/" PKGBUILD
updpkgsums
echo "creating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
#sha256sum skywire-scripts.tar.gz
echo "don't forget to increment pkgrel if you edited the PKGBUILD"
source PKGBUILD && echo "pkgver=${pkgver}" && echo "pkgrel=${pkgrel}"
echo
echo "git add -f PKGBUILD .SRCINFO updates.sh"
echo 'git commit -m " "'
