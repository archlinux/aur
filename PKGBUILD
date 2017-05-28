# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python2-spatial-media
pkgver=2.0
pkgrel=1
pkgdesc="Specifications and tools for 360º video and spatial audio."
arch=('any')
url="https://github.com/google/spatial-media"
license=('APACHE2')
depends=('python2')
source=("https://github.com/google/spatial-media/archive/v${pkgver}.tar.gz")
md5sums=('7c3407a717e1c01584c7a956110ca255')

package() {
  cd "${srcdir}/spatial-media-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
