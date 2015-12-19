# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-imageio
pkgver=1.4
pkgrel=1
pkgdesc="Library for reading and writing a wide range of image, video, scientific, and volumetric data formats"
arch=('any')
url="https://pypi.python.org/pypi/imageio/"
license=('MIT')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/i/imageio/imageio-${pkgver}.zip)
sha256sums=('ad9a3e75ffa802cca87a56bfdc6af7facbf8db5c62232b63c9822f10ac49292e')

package() {
  cd "$srcdir/imageio-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
