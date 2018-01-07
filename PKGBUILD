# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=python2-mysql2pgsql
pkgver=0.1.5
pkgrel=2
pkgdesc="Tool for migrating/converting from mysql to postgresql"
arch=(any)
url="https://pypi.python.org/pypi/py-mysql2pgsql"
license=('GPL')
depends=('python2' 'python2-psycopg2' 'python2-yaml' 'python2-termcolor' 'mysql-python')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/p/py-mysql2pgsql/py-mysql2pgsql-$pkgver.tar.gz)
md5sums=('f9383fc558dff6f6c1e304465ff702da')

package() {
	cd "$srcdir/py-mysql2pgsql-$pkgver"
	python2 setup.py install --root="$pkgdir"
}
