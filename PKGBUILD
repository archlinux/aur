# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-toolz
pkgver=0.7.4
pkgrel=1
pkgdesc="A set of utility functions for iterators, functions, and dictionaries."
arch=('any')
url="https://pypi.python.org/pypi/toolz"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/toolz/toolz-$pkgver.tar.gz")
sha256sums=('43c2c9e5e7a16b6c88ba3088a9bfc82f7db8e13378be7c78d6c14a5f8ed05afd')


package() {
  cd "$srcdir/toolz-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:ts=2:sw=2:et:
