# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=videomaker
pkgver=0.2
pkgrel=2
pkgdesc="Build a movie from pictures"
arch=('any')
url="https://github.com/sciunto/VideoMaker"
license=('GPL3')
depends=('python' 'texlive-core' 'texlive-bin' 'mencoder' 'ffmpeg' 'python-pillow')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/V/VideoMaker/VideoMaker-${pkgver}.tar.gz)
sha256sums=('400d06b316057fefd5a650e7f9a5b8e33c120976e95650d501cb33a9d17bd69e')

package() {
  cd "${srcdir}/VideoMaker-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


# vim:ts=2:sw=2:et:
