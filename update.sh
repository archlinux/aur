#!/bin/bash
set -e

ver=$1

sed -E -i PKGBUILD -e 's|pkgver=.*|pkgver='$ver'|g'
updpkgsums
makepkg --printsrcinfo >.SRCINFO

git commit PKGBUILD .SRCINFO -m "update to $ver"
