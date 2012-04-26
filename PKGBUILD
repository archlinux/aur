# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-stompy
pkgver=0.2.9
pkgrel=1
pkgdesc="Python STOMP client library"
arch=(any)
url="http://packages.python.org/stompy/introduction.html"
license=(BSD)
depends=(python2)
source=(http://pypi.python.org/packages/source/s/stompy/stompy-$pkgver.tar.gz)

build() {
     cd "$srcdir/stompy-$pkgver"
     python2 setup.py install -O1 --root="$pkgdir"
}

md5sums=('aca5be1a264bfeb4de1d268b69f73a3c')
