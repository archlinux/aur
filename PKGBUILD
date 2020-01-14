# Maintainer: H. Rosendahl <h [at] ro [dot] sendahl [dot] de>

pkgname='otf-jost'
pkgver=3.5
pkgrel=1
replaces=('otf-renner')
conflicts=('otf-renner')
pkgdesc="An original font created by indestructible type*. It is inspired by the designs of Paul Renner."
url="http://indestructible-type.github.io/Jost.html"
arch=(any)
license=(custom)
source=("Jost-${pkgver}.zip::https://github.com/indestructible-type/Jost/releases/download/${pkgver}/Jost.zip")

sha256sums=('1030acfb33af22e9bbd2217706c76da87a94c41c58a8ec6d61e785696b1469d9')

package() {
  install -d "${pkgdir}/usr/share/fonts/jost"
  install -t "${pkgdir}/usr/share/fonts/jost" -m644 "${srcdir}/Jost-master/fonts/otf/"*.otf
  install -Dm644 "${srcdir}/Jost-master/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
