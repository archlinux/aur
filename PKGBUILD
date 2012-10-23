# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pika
pkgver=0.9.5
pkgrel=2
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

sha256sums=('95a017bfeeff4513755445905d383547ad6804254764a6205eca5a92122debc4')
