#!/bin/bash
set -eu
usage(){
	echo "${0} \$version"
	exit 1
}

[[ $# -ne 1 ]] && usage
sed -i'' 's/^pkgver=.*$/pkgver='"${1}"'/' PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
