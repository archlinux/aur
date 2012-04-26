# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-stomp.py
pkgver=3.1.1
pkgrel=1
pkgdesc="Python STOMP client, supporting versions 1.0 and 1.1 of the protocol"
arch=(any)
url="http://code.google.com/p/stomppy"
license=(Apache 2.0)
depends=(python)
source=(http://stomppy.googlecode.com/files/stomp.py-$pkgver.tar.gz)

build() {
     cd "$srcdir/stomp.py-$pkgver"
     python setup.py install -O1 --root="$pkgdir"
}

md5sums=('c151d41d61db53177db9d80d90c11113')
