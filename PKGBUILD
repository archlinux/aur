# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pika
pkgver=0.9.6
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Pure-Python implementation of the AMQP 0-9-1"
arch=(any)
url="http://pika.readthedocs.org/"
license=('GPL')
depends=(python2)
makedepends=(python2-distribute)
source=(http://pypi.python.org/packages/source/p/$_libname/$_libname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py install -O1 --root="$pkgdir"
}

sha256sums=('218c5acc05878958a58a9eeb126ba60d91335879016054eb257e53cdfeab1863')
