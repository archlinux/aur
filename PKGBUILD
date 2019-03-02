# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-pydle
_pkgname=pydle
pkgver=0.9.1
pkgrel=1
pkgdesc="A compact, flexible and standards-abiding IRC library for Python 3."
arch=(any)
url="https://github.com/Shizmob/pydle"
license=('BSD')
depends=('python' 'python-tornado')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/pydle/pydle-$pkgver.tar.gz")
sha256sums=('44ae714256a4e1b89983e55569ad6762f9a5bf718d75ce0e2c3bb0e83cf1c28e')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
