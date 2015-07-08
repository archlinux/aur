# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-imageio
pkgver=1.3
pkgrel=1
pkgdesc="Library for reading and writing a wide range of image, video, scientific, and volumetric data formats"
arch=('any')
url="https://pypi.python.org/pypi/imageio/"
license=('MIT')
depends=('python' 'python-numpy')
source=(https://pypi.python.org/packages/source/i/imageio/imageio-${pkgver}.tar.gz)
sha256sums=('ce818a09fcc258f6a1d9ec3a144d3ed35a45ff8e5482ad7e2592cb128a1084dd')

package() {
  cd "$srcdir/imageio-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
