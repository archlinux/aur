# Maintainer: H. Rosendahl <h [at] ro [dot] sendahl [dot] de>

pkgname='otf-jost'
pkgver=3.3
pkgrel=1
replaces=('otf-renner')
conflicts=('otf-renner')
pkgdesc="An original font created by indestructible type*. It is inspired by the designs of Paul Renner."
url="http://indestructible-type.github.io/Renner.html"
arch=(any)
license=(custom)
source=("Jost.zip::https://github.com/indestructible-type/Jost/releases/download/${pkgver}/Jost.zip")

sha256sums=('7a274c612c5f02b8de53c7c120a67812847ea6789489d8809feffd238512ad46')

package() {
  cd "${srcdir}/OpenType/"
  install -d "$pkgdir/usr/share/fonts/jost"
  install -t "$pkgdir/usr/share/fonts/jost" -m644 *.otf
  install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
