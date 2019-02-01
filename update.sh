#!/bin/env bash

set -e

VERSION=$1

echo $VERSION
FILE=helmfile_linux_amd64_${VERSION}

wget https://github.com/roboll/helmfile/releases/download/v${VERSION}/helmfile_linux_amd64 -O $FILE
SUM=$(sha256sum $FILE | awk '{print $1}')
echo $SUM
rm $FILE

sed -i /pkgver=/c\pkgver=$VERSION PKGBUILD
sed -i /pkgrel=/c\pkgrel=1 PKGBUILD
sed -i /sha256sums=/c\sha256sums=\(\'$SUM\'\) PKGBUILD

makepkg --printsrcinfo > .SRCINFO
