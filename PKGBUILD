# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-toolz
pkgver=0.7.2
pkgrel=1
pkgdesc="A set of utility functions for iterators, functions, and dictionaries."
arch=('any')
url="https://pypi.python.org/pypi/toolz"
license=('BSD')
depends=('python')
source=("https://pypi.python.org/packages/source/t/toolz/toolz-$pkgver.tar.gz")
sha256sums=('56b2fc25d48337c39a30545ae28d643df28a2d63be12aae3c1336edc485098b1')


package() {
  cd "$srcdir/toolz-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}

# vim:ts=2:sw=2:et:
