# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-tifffile
pkgver=0.6.2
_name=tifffile
pkgrel=1
pkgdesc="Read and write image data from and to TIFF files"
arch=('any')
url="https://pypi.python.org/pypi/tifffile"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('9c2b700d80ab2ec56d748216cdd32f09986e54c908aa47efc226d4101350fbd6')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
