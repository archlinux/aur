# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=gimp-plugin-iglo
pkgver=1.8
pkgrel=1
pkgdesc="Images Grid LayOut plugin for GIMP"
arch=(any)
url="http://iglo.svoboda.biz/"
license=('Apache')
depends=('gimp')
source=("http://iglo.svoboda.biz/images-grid-layout_${pkgver}.tar")
md5sums=('76dbf6cd625713384874b941783439f6')
sha256sums=('711c9869202e152453a73f2d04c93ba12e4b9c0afd188b99f9d3f34ffabef4fa')

package() {
  install -Dm644 "$srcdir/images-grid-layout.scm" "$pkgdir/usr/share/gimp/2.0/scripts/images-grid-layout.scm"
}
