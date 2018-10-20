# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-imageio
pkgver=2.4.1
pkgrel=1
pkgdesc="Library for reading and writing a wide range of image, video, scientific, and volumetric data formats"
arch=('any')
url="https://pypi.python.org/pypi/imageio/"
license=('MIT')
depends=('python2' 'python2-numpy' 'freeimage' 'ffmpeg' 'avbin')
makedepends=('python2-setuptools')
optdepends=('python2-astropy' 'simpleitk')
source=("https://github.com/imageio/imageio/archive/v${pkgver}.zip")
sha256sums=('ed46c4a767a798324c99e1ef677a3b3a74c733063dec84c6142b3c255243dff1')

package() {
  cd "$srcdir/imageio-$pkgver"
  python2 setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
