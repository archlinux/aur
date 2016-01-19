# Maintainer: XavierCLL

pkgname=python-pycksum
_pkgname=pycksum
pkgver=0.4.1
pkgrel=1
pkgdesc="Python implementation of cksum algorithm"
arch=(any)
url="https://pypi.python.org/pypi/pycksum"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
source=(https://pypi.python.org/packages/source/p/pycksum/$_pkgname-$pkgver.tar.gz)
md5sums=('ea87b2769ea1ed5bfd91261f250c8060')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
