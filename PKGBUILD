# Maintainer: XavierCLL

pkgname=python-pycksum
_pkgname=pycksum
pkgver=0.4.2
pkgrel=1
pkgdesc="Python implementation of cksum algorithm"
arch=(any)
url="https://pypi.python.org/pypi/pycksum"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
source=(https://pypi.python.org/packages/1a/19/ec22db87da5c522b08fefdc424e8e367e55e074f51d09995806f237b0ccf/$_pkgname-$pkgver.tar.gz)
md5sums=('0b73ade01884ba153a8d8c5f155ac4d3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}
