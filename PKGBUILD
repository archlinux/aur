# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=python-bus
pkgver=3.1.3
pkgrel=1
pkgdesc="Python 3 module for bus"
arch=(i686 x86_64)
url="https://github.com/maandree/python-bus"
license=('custom:ISC')
depends=(bus python)
makedepends=(cython)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(9901615ffac666b463399191e56bdebf2eabb20380f193f88b6b6c45ed56e3e0)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
