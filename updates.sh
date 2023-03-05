#!/bin/bash

_version=$(git ls-remote --tags --refs --sort="version:refname" https://github.com/skycoin/skywire.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
#override
#_version=1.3.4
#Uncomment to use release candidates or pre-releases for testing
#get release candidate version from source repo
#_vrc=$(git ls-remote --tags --refs --sort="version:refname" https://github.com/skycoin/skywire.git | tail -n1 | grep -- -rc)
#if [[ $_vrc != "" ]]; then
#	_vrc="-${_vrc##*-}"
#fi
#get release candidate version from source repo
#_vrc=$(git ls-remote --tags --refs --sort="version:refname" https://github.com/skycoin/skywire.git | tail -n1 | grep -- -pr)
#if [[ $_vrc != "" ]]; then
#	_vrc="-${_vrc##*-}"
#fi
echo "remote version="${_version}
if [[ ${_vrc} != "" ]]; then
echo "remote version="${_vrc}
fi
echo "updating checksums and version for PKGBUILD"
sed -i "s/^pkgver=.*/pkgver='${_version}'/" PKGBUILD && sed -i "s/^_rc=.*/_rc='${_vrc}'/" PKGBUILD && updpkgsums
find *.PKGBUILD | parallel unbuffer updpkgsums {}
echo "creating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
#sha256sum skywire-scripts.tar.gz
echo "don't forget to increment pkgrel if you edited the PKGBUILD"
source PKGBUILD && echo "pkgver=${pkgver}" && echo "pkgrel=${pkgrel}"
echo
echo "git add -f " *PKGBUILD " .SRCINFO skywire-autoconfig " *.desktop *.png *.service *.sh *.conf *.install
echo 'git commit -m " "'
