# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=morbid
pkgver=0.8.7.3
pkgrel=3
pkgdesc="A Twisted-based publish/subscribe messaging server that uses the STOMP protocol"
arch=("any")
url="http://pypi.python.org/pypi/morbid/"
license=('MIT')
depends=(python2)
makedepends=(python2-setuptools)
source=(http://pypi.python.org/packages/source/m/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('71a9c88cee81dc473645e8568985dddd92437ca5e0bfc4558677573f8cad9fce')
