#!/bin/bash

set -e

if [ $# -ne 1 ]; then
	echo "error: invalid arguments"
	exit 1
fi

sed -ri PKGBUILD -e "s/pkgver=.+/pkgver=$1/"
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git commit -am "Reflect new upstream release v$1"

makepkg
git clean -xdf
