# Maintainer: H. Rosendahl <h [at] ro [dot] sendahl [dot] de>

pkgname='otf-jost'
pkgver=3.3
pkgrel=1
replaces=('otf-renner')
conflicts=('otf-renner')
pkgdesc="An original font created by indestructible type*. It is inspired by the designs of Paul Renner."
url="http://indestructible-type.github.io/Jost.html"
arch=(any)
license=(custom)
source=("Jost.zip::https://github.com/indestructible-type/Jost/releases/download/${pkgver}/Jost.zip")

sha256sums=('f3156f3206362223b670edaa2547b1424ee9eaadc61a3dbc06dccc46f7a686ef')

package() {
  cd "${srcdir}/Finished OpenType/"
  install -d "$pkgdir/usr/share/fonts/jost"
  install -t "$pkgdir/usr/share/fonts/jost" -m644 *.otf
  install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
