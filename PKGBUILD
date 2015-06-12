# Maintainer: Michael Schubert <mschu.dev at google mail>

pkgname=jessyink2
_pkgname=JessyInk
pkgver=2.0.0.alpha.1
_pkgver=2_0_0_alpha_1
pkgrel=1
pkgdesc="JavaScript that turns a layered Inkscape SVG image into a presentation"
url="http://code.google.com/p/jessyink/"
license=('GPL')
arch=('any')
depends=('inkscape')
source=("http://jessyink.googlecode.com/files/${_pkgname}_$_pkgver.svg")
md5sums=('eb4fe6851e772d9963e96f539af724d8')

package() {
  cd "$srcdir"
  install -Dm644 "${_pkgname}_$_pkgver.svg" \
    "$pkgdir/usr/share/inkscape/templates/${_pkgname}_$_pkgver.svg"
}
