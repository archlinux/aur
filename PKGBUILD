# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-imageio
pkgver=2.1.2
pkgrel=1
pkgdesc="Library for reading and writing a wide range of image, video, scientific, and volumetric data formats"
arch=('any')
url="https://pypi.python.org/pypi/imageio/"
license=('MIT')
depends=('python' 'python-numpy' 'freeimage' 'ffmpeg' 'avbin')
makedepends=('python-setuptools')
optdepends=('python-astropy' 'simpleitk')
source=("https://files.pythonhosted.org/packages/source/i/imageio/imageio-${pkgver}.zip")
sha256sums=('89d7692d9f513aa21665af7de94948bc1ef110d812fa66c34bfd486590d986bb')

package() {
  cd "$srcdir/imageio-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
