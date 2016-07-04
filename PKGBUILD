# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-tifffile
pkgver=0.9.2
_name=tifffile
pkgrel=1
pkgdesc="Read and write image data from and to TIFF files"
arch=('any')
url="https://pypi.python.org/pypi/tifffile"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/82/ee/4fd48630aa104e568c4abcdec2e0cddf4f9c662d81eb3a0980282a31b32d/tifffile-${pkgver}.zip)
sha256sums=('950f14febf08f5bb6daa40137761d31ec38482dace3edea24feb54e229a4efbf')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
