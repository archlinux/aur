# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-oursql
pkgver=0.9.2
pkgrel=1
pkgdesc="Set of MySQL bindings for python with real parameterization and real server-side cursors."
arch=(any)
url="https://launchpad.net/oursql"
license=('BSD')
depends=('python2' 'libmysqlclient')
makedepends=('python2-distribute')
source=(http://launchpad.net/oursql/trunk/$pkgver/+download/oursql-$pkgver.tar.bz2)
md5sums=('f0ecbdde6d4f6e45538a609292018665')

build() {
	cd "$srcdir/oursql-$pkgver"
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}


