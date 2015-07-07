# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-pydle
_pkgname=pydle
pkgver=0.8.0
pkgrel=2
pkgdesc="A compact, flexible and standards-abiding IRC library for Python 3."
arch=(any)
url="https://github.com/Shizmob/pydle"
license=('BSD')
depends=('python' 'python-tornado')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/pydle/pydle-$pkgver.tar.gz")
md5sums=('38df5a64ca6abad3b54f18b52665956f')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
