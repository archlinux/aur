# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pika
pkgver=0.9.5
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Pure-Python implementation of the AMQP 0-9-1"
arch=(any)
url="http://tonyg.github.com/pika/"
license=('GPL')
depends=(python2)
source=(http://pypi.python.org/packages/source/p/$_libname/$_libname-$pkgver.tar.gz)
md5sums=(38527f6977bf0a0b204710b93b0c6417)

build() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py install -O1 --root="$pkgdir"
}
