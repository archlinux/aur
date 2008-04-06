# $Id: PKGBUILD,v 1.9 2008/01/29 09:57:46 james Exp $
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: Sebastian Sareyko <public@nooms.de>
pkgname=nitrogen
pkgver=1.2
# author has habit of using -rc and things for version. left here for future use.
_pkgver=1.2
pkgrel=2
pkgdesc="A background browser and setter for X windows"
arch=('i686' 'x86_64')
url="http://l3ib.org/nitrogen/"
license=("GPL")
depends=('gtkmm')
source=(http://projects.l3ib.org/nitrogen/files/nitrogen-${_pkgver}.tar.gz)

build() {
  cd $startdir/src/nitrogen-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}






md5sums=('a0c08236aa1683e020d607a42f3233fc')
