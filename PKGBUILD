# Contributor: Richard PALO <richard.palo@free.fr>
pkgname=python2-sql
pkgver=0.9
pkgrel=1
pkgdesc="Library to write SQL queries"
arch=('any')
url="http://python-sql.tryton.org/"
license=('BSD')
depends=('python2')
optdepends=()
makedepends=('python2')
md5sums=('63351de94115d5706d8038febb520e82')
source=("https://pypi.io/packages/source/p/python-sql/python-sql-$pkgver.tar.gz")

build() {
    cd $srcdir/python-sql-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/python-sql-$pkgver
    python2 setup.py install --root=$pkgdir
}
