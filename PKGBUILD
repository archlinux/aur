# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=mat2
pkgver=0.3.0
pkgrel=1
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://0xacab.org/jvoisin/mat2ttps://mat.boum.org"
license=('GPL2')
depends=('python' 'perl' 'perl-image-exiftool' 'python-mutagen' 'python-cairo' 'python-gobject')
source=(https://0xacab.org/jvoisin/mat2/-/archive/0.3.0/mat2-${pkgver}.zip)
sha256sums=('9efc196bcc1efb6b0f3284fec5061c04e69d15e74a13730a35b74901a14f31c0')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
