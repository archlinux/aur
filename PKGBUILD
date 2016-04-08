# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-tifffile
pkgver=0.8.0
_name=tifffile
pkgrel=1
pkgdesc="Read and write image data from and to TIFF files"
arch=('any')
url="https://pypi.python.org/pypi/tifffile"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('15ab0fa95967fd4470b9f755c43be801fb60bff089db189845077e1bb1da5566')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
