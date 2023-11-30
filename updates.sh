#!/bin/bash
if [[ -z $_pvernew ]] ; then
_version=$(git ls-remote --tags --refs --sort="version:refname" https://github.com/skycoin/skywire.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
else
  _version=$_pvernew
fi
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
source PKGBUILD
_prel="$(curl -s https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${pkgname} | grep pkgrel | cut -d "=" -f2 | tr -d "'")"
if [[ -z $_prelnew ]] ; then
_prelnew=$_prel
let _prelnew++
fi
echo "setting pkgver=$_version, pkgrel=${_prelnew} for PKGBUILD"
sed -i "s/^pkgver=.*/pkgver='${_version}'/" PKGBUILD && sed -i "s/^_rc=.*/_rc='${_vrc}'/" PKGBUILD && sed -i "s/^pkgrel=.*/pkgrel='${_prelnew}'/" PKGBUILD
echo "updating checksums for PKGBUILD(s)"
updpkgsums
find *.PKGBUILD | parallel updpkgsums {}
echo "creating .SRCINFO"
echo "makepkg --printsrcinfo > .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
#sha256sum skywire-scripts.tar.gz
echo "old pkgrel=$_prel"
source PKGBUILD && echo "pkgver=${pkgver}" && echo "pkgrel=${pkgrel}"
echo
echo "git add -f " *PKGBUILD " .SRCINFO skywire-autoconfig " *.desktop *.png *.service *.sh *.conf *.install
echo 'git commit -m " "'
echo "aurpublish ${pkgname}"
echo "git push"
