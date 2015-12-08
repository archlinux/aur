#!/bin/bash

mkdir -p tmp
cd tmp
wget -O qt5-base-i686.pkg.tar.xz https://www.archlinux.org/packages/extra/i686/qt5-base/download/
bsdtar xf qt5-base-i686.pkg.tar.xz .PKGINFO
cd ..

# generate pkgver
PKGVER=`grep pkgver tmp/.PKGINFO | cut -d"=" -f2 | tr -d '[[:space:]]' | tr "-" "_"`

# generate depends (ignore qtchooser and libinput)
DEPENDS=`grep "^depend"  tmp/.PKGINFO | grep -v 'qtchooser\|libinput' | sed "s|.*=\s*\(.*\)|'lib32-\1'|" | tr "\n" " "`
# add static depends (these are always added)
DEPENDS="$DEPENDS 'qt5-base'"

# get md5sum
MD5SUM=`md5sum tmp/qt5-base-i686.pkg.tar.xz | cut -d" " -f1`

# update the PKGBUILD
sed -i "s|pkgver=.*|pkgver=$PKGVER|" PKGBUILD
sed -i "s|depends=.*|depends=($DEPENDS)|" PKGBUILD
sed -i "s|md5sums=.*|md5sums=('$MD5SUM')|" PKGBUILD
