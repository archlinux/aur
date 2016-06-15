# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-imageio
pkgver=1.5
pkgrel=2
pkgdesc="Library for reading and writing a wide range of image, video, scientific, and volumetric data formats"
arch=('any')
url="https://pypi.python.org/pypi/imageio/"
license=('MIT')
depends=('python' 'python-numpy' 'freeimage' 'ffmpeg' 'avbin')
makedepends=('python-setuptools')
optdepends=('python-astropy' 'simpleitk')
source=(https://pypi.python.org/packages/source/i/imageio/imageio-${pkgver}.zip)
sha256sums=('37ab7ad6ca37905cee6b3535a0dba21506647d663b4414089b85b20e2b9f985d')

package() {
  cd "$srcdir/imageio-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
