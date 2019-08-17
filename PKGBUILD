# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python-pydle
_pkgname=pydle
pkgver=0.9.2
pkgrel=1
pkgdesc="A compact, flexible and standards-abiding IRC library for Python 3."
arch=(any)
url="https://github.com/Shizmob/pydle"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/pydle/pydle-$pkgver.tar.gz")
sha256sums=('f89816e5d5b26d3de4854cbbc57fd86ad7e82c900c44eef0bc84b00aada2508d')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
}
