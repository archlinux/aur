# Maintainer: H. Rosendahl <h [at] ro [dot] sendahl [dot] de>

pkgname='otf-jost'
pkgver=3.4
pkgrel=1
replaces=('otf-renner')
conflicts=('otf-renner')
pkgdesc="An original font created by indestructible type*. It is inspired by the designs of Paul Renner."
url="http://indestructible-type.github.io/Jost.html"
arch=(any)
license=(custom)
source=("Jost-${pkgver}.zip::https://github.com/indestructible-type/Jost/releases/download/${pkgver}/Jost.zip")

sha256sums=('e0008810945b5073a72d98daea24227474101e60f459bb1c08e6c63bcf5337ba')

package() {
  install -d "${pkgdir}/usr/share/fonts/jost"
  install -t "${pkgdir}/usr/share/fonts/jost" -m644 "${srcdir}/Jost-master/Finished OpenType/"*.otf
  install -Dm644 "${srcdir}/Jost-master/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
