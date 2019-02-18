# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-tifffile
pkgver=2019.2.10
_name=tifffile
pkgrel=1
pkgdesc="Read and write image data from and to TIFF files"
arch=('any')
url="https://pypi.python.org/pypi/tifffile"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/8d/5d/8c93c6236ba7d54f79fdec15d3b9ed32b5e2c48b5c4838a5240893b70908/tifffile-2019.2.10.tar.gz)
sha256sums=('ead5f84c0b100f8100377b8ef2bcffaf21c249784ddc240346b715408b45f42c')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
