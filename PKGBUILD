# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-tifffile
pkgver=0.8.0
_name=tifffile
pkgrel=1
pkgdesc="Read and write image data from and to TIFF files"
arch=('any')
url="https://pypi.python.org/pypi/tifffile"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://github.com/blink1073/tifffile/archive/v${pkgver}.zip)
sha256sums=('caaec90acc18a8395df922543b25ec8f5ded03e6d5896342f2f23c4824ca17fb')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
