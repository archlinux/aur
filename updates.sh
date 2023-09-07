#!/bin/bash
#updpkgsums cc.deb.PKGBUILD
updpkgsums deb.PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "git add -f deb.PKGBUILD PKGBUILD .SRCINFO com.emercoin.Emercoin.desktop emc48.png emercoind.service emercoin.install updates.sh"
echo 'git commit -m ""'
echo "git push"
