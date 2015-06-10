# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=mat
pkgver=0.5.3
pkgrel=2
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://mat.boum.org"
license=('GPL2')
depends=('python2-distutils-extra' 'python2' 'hachoir-core' 'hachoir-parser' 'python2-cairo' 'python2-poppler' 'python2-pdfrw' 'python2-gobject' 'python2-pillow')
optdepends=('perl-image-exiftool: extended image support',
'mutagen: extended audio format support')
source=(https://mat.boum.org/files/mat-${pkgver}.tar.xz)

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
sha256sums=('616fc4ba13a7ce2a20acd6639a776fa4ee6a61caf999ed64b4545d3f83a41cfd')
