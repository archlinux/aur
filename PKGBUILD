# Maintainer: Michael Schubert <mschu.dev at google mail>
pkgname=jessyink2
_pkg=JessyInk_2_0_0_alpha_1
pkgver=2.0.0.alpha.1
pkgrel=1
pkgdesc="JavaScript that turns a layered Inkscape SVG image into a presentation"
url="http://code.google.com/p/jessyink/"
license=('GPL')
arch=('any')
depends=('inkscape' 'python2-lxml')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/jessyink/$_pkg.svg")
md5sums=('eb4fe6851e772d9963e96f539af724d8')

package() {
  cd "$srcdir"
  install -Dm644 "$_pkg.svg" \
    "$pkgdir/usr/share/inkscape/templates/$_pkg.svg"
}
