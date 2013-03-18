# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-oursql
pkgver=0.9.3
pkgrel=1
pkgdesc="Set of MySQL bindings for python with real parameterization and real server-side cursors."
arch=(any)
url="https://launchpad.net/oursql"
license=('BSD')
depends=('python2' 'libmysqlclient')
makedepends=('python2-distribute')
source=(http://launchpad.net/oursql/trunk/$pkgver/+download/oursql-$pkgver.tar.bz2)

build() {
	cd "$srcdir/oursql-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/oursql-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}


md5sums=('7434641f40c0b81eb563ec65222838dc')
