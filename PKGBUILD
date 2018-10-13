# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=mat2
pkgver=0.4.0
pkgrel=1
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://0xacab.org/jvoisin/mat2"
license=('GPL3')
depends=('python' 'perl' 'perl-image-exiftool' 'python-mutagen' 'python-cairo' 'python-gobject')
source=(https://0xacab.org/jvoisin/mat2/-/archive/${pkgver}/mat2-${pkgver}.zip)
sha256sums=('9769df6fd0575ba61cf76ebf00b59015f0deea3385934569bb1b8bddc08228a2')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
