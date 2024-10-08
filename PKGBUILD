# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=python-bus
pkgver=3.1.4
pkgrel=1
pkgdesc="Python 3 module for bus"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/python-bus"
license=('ISC')
depends=(bus python)
makedepends=(cython)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6cedd1d73336f839cbb0cdde4f6550f5dd61271a65224a5e738b23882b1fe5d1)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
