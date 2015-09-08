pkgname=python2-sql
pkgver=0.7
pkgrel=1
pkgdesc="Library to write SQL queries"
arch=('any')
url="http://hg.tryton.org/python-sql"
license=('GPL3')
depends=('python2')
optdepends=()
makedepends=('python2')
md5sums=('d00674dbcf4e971cc3a64f2373f7255f')
source=("https://pypi.python.org/packages/source/p/python-sql/python-sql-$pkgver.tar.gz")

build() {
    cd $srcdir/python-sql-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/python-sql-$pkgver
    python2 setup.py install --root=$pkgdir
}
