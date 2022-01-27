#!/bin/bash
#updpkgsums cc.deb.PKGBUILD
updpkgsums deb.PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -f deb.PKGBUILD PKGBUILD .SRCINFO
