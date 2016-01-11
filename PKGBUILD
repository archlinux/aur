# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python2-namedlist
pkgver=1.7
pkgrel=1
pkgdesc="Like namedtuples, but mutable"
arch=(any)
url="http://pypi.python.org/pypi/namedlist"
license=('Apache')
depends=('python2')
source=("http://pypi.python.org/packages/source/n/namedlist/namedlist-$pkgver.tar.gz")
md5sums=('91932e6797b13df64bffcec4b5c810a3')

build() {
  cd "$srcdir/namedlist-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/namedlist-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
}
