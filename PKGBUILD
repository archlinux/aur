# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-toolz
pkgver=0.8.0
pkgrel=1
pkgdesc="A set of utility functions for iterators, functions, and dictionaries."
arch=('any')
url="https://pypi.python.org/pypi/toolz"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/pytoolz/toolz/archive/$pkgver.tar.gz")
sha256sums=('809b60ff8fc88f1e4ff8547330bd5b8f8f8f17996ad36974defcdcd24868ef24')


package() {
  cd "$srcdir/toolz-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:ts=2:sw=2:et:
