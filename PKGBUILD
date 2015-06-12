# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=python-bus
pkgver=3.1
pkgrel=1
pkgdesc="Python 3 module for bus"
arch=(i686 x86_64)
url="https://github.com/maandree/python-bus"
license=('MIT')
depends=(bus python)
makedepends=(cython)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(1fd60b900076c119742905c2636728c08ba55d733ca8ca2d55f941aa2aed4fa6)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

