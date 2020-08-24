# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-pydle
_pkgname=pydle
pkgver=0.9.4
pkgrel=1
pkgdesc="A compact, flexible and standards-abiding IRC library for Python 3."
arch=(any)
url="https://github.com/Shizmob/pydle"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Shizmob/pydle/archive/v$pkgver.tar.gz")
sha256sums=('319f6fd5e6beb502b2af024dd52819fdbb67b625a4c4d3cc417408529662fe66')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
