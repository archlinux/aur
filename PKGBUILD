# Maintainer: Your Name <youremail@domain.com>
pkgname=python2-pika
pkgver=0.9.4
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Pure-Python implementation of the AMQP 0-9-1"
arch=(any)
url="http://tonyg.github.com/pika/"
license=('GPL')
depends=(python2)
source=(http://pypi.python.org/packages/source/p/$_libname/$_libname-$pkgver.tar.gz)
md5sums=(a00b44080c438e3233c05073a145e3dc)

build() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py install --root=$pkgdir
}
