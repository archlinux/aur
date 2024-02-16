#!/bin/bash
#updpkgsums cc.deb.PKGBUILD
if [[ -z $_pvernew ]] ; then
_version=$(git ls-remote --tags --refs --sort="version:refname" https://github.com/emercoin/emercoin.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
_version=${_version//emc/}
else
  _version=$_pvernew
fi
source PKGBUILD
_prel="$(curl -s https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${pkgname} | grep pkgrel | cut -d "=" -f2 | tr -d "'")"
if [[ -z $_prelnew ]] ; then
_prelnew=$_prel
let _prelnew++
fi
echo "setting pkgver=$_version, pkgrel=${_prelnew} for PKGBUILD"
sed -i "s/^pkgver=.*/pkgver='${_version}'/" PKGBUILD && sed -i "s/^_rc=.*/_rc='${_vrc}'/" PKGBUILD && sed -i "s/^pkgrel=.*/pkgrel='${_prelnew}'/" PKGBUILD
echo "updating checksums for PKGBUILD(s)"
updpkgsums deb.PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "git add -f deb.PKGBUILD PKGBUILD .SRCINFO com.emercoin.Emercoin.desktop emc48.png emercoind.service emercoin.install updates.sh"
echo 'git commit -m ""'
echo "git push"
