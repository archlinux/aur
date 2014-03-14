# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=mat
pkgver=0.5.1
pkgrel=1
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://mat.boum.org"
license=('GPL2')
depends=('python2-distutils-extra' 'python2' 'hachoir-core' 'hachoir-parser' 'python2-cairo' 'python2-poppler' 'python2-pdfrw' 'mutagen' 'python2-gobject')
optdepends=('perl-image-exiftool: extended image support')
source=(https://mat.boum.org/files/mat-${pkgver}.tar.xz)

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('a56b1193d27ba619136fb66ba2d0c0fa')
