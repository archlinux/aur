# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=python-bus
pkgver=3.1.1
pkgrel=1
pkgdesc="Python 3 module for bus"
arch=(i686 x86_64)
url="https://github.com/maandree/python-bus"
license=('MIT')
depends=(bus python)
makedepends=(cython)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(f29d142b25b174831ba678976264c8fa3cb444e3de542491f30f56c889a1fc60)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

