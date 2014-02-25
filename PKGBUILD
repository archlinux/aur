# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-oursql
pkgver=0.9.3.1
pkgrel=1
pkgdesc="Set of MySQL bindings for python with real parameterization and real server-side cursors."
arch=(any)
url="https://launchpad.net/oursql"
license=('BSD')
depends=('python2' 'libmysqlclient')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/o/oursql/oursql-$pkgver.tar.bz2)

build() {
	cd "$srcdir/oursql-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/oursql-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('9440ec2aacda8d32d5400ab3cdb2ac27a0a3aff68919ce7fbdbc66934c0120ab')
