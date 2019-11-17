# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-pydle
_pkgname=pydle
pkgver=0.9.3
pkgrel=1
pkgdesc="A compact, flexible and standards-abiding IRC library for Python 3."
arch=(any)
url="https://github.com/Shizmob/pydle"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Shizmob/pydle/archive/v$pkgver.tar.gz")
sha256sums=('b7b31852bf7eccd9e9f2c5e857e762b09fe594d9756621708be8375a28447527')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
