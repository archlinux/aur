#!/bin/bash
set -e -u -o pipefail

VERSION=$1
PKGREL=${2:-1}
SOURCE="https://github.com/k9withabone/podlet/archive/v$VERSION.tar.gz"
NAME="fw"
SHA256=$(curl -L --silent --fail $SOURCE  | sha256sum | awk '{print $1}')

rm -f $NAME*



sed -e "s#__VERSION__#$VERSION#g" \
    -e "s#__SOURCE__#$SOURCE#g" \
    -e "s#__SHA256__#$SHA256#g" \
    -e "s#__PKGREL__#$PKGREL#g" \
    PKGBUILD.tmpl > PKGBUILD

makepkg --printsrcinfo > .SRCINFO
makepkg
