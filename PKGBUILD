# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=python2-mysql2pgsql
pkgver=0.1.6
pkgrel=2
pkgdesc="Tool for migrating/converting from mysql to postgresql"
arch=(any)
url="https://pypi.python.org/pypi/py-mysql2pgsql"
license=('GPL')
depends=('python2' 'python2-psycopg2' 'python2-yaml' 'python2-termcolor' 'mysql-python' 'python2-pytz' 'python2-argparse')
makedepends=('python2-setuptools')
source=(https://github.com/philipsoutham/py-mysql2pgsql/archive/v$pkgver.zip)
md5sums=('378f770e59c24f0d2f8633b557a28681')

package() {
	cd "$srcdir/py-mysql2pgsql-$pkgver"
	python2 setup.py install --root="$pkgdir"
}
