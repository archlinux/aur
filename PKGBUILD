# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-namedlist
pkgver=1.4
pkgrel=1
pkgdesc="Like namedtuples, but mutable"
arch=(any)
url="http://pypi.python.org/pypi/namedlist"
license=('Apache')
depends=('python')
source=("http://pypi.python.org/packages/source/n/namedlist/namedlist-$pkgver.tar.gz")
md5sums=('09eb613c625e73c64a1f84427e1b7170')

build() {
  cd "$srcdir/namedlist-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/namedlist-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}
