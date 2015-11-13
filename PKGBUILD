# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-tifffile
pkgver=0.7.0
_name=tifffile
pkgrel=1
pkgdesc="Read and write image data from and to TIFF files"
arch=('any')
url="https://pypi.python.org/pypi/tifffile"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('1727ff94055022f6dda5ce1b54af734a3345628ece850a2020f609208472cd91')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
