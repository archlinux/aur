# Maintainer: James Rayner <james@archlinux.org>
# Contributor: Sebastian Sareyko <public@nooms.de>
pkgname=nitrogen
pkgver=1.3
# author has habit of using -rc and things for version. left here for future use.
_pkgver=1.3
pkgrel=1
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







md5sums=('1f2b0b40ac286d0b185b23f234b237dd')
