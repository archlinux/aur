# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

_fontname=economica
pkgname=otf-${_fontname}
pkgver=20160430
pkgrel=1
pkgdesc="A very condensed type. Accomplishes horizontal compression while keeping a strong personality."
arch=("any")
url="https://www.fontsquirrel.com/fonts/economica"
license=("custom:OFL")
depends=("fontconfig" "xorg-font-utils")
source=("https://www.fontsquirrel.com/fonts/download/${_fontname}")
install=${pkgname}.install
md5sums=('SKIP')

package() {
  find . -name 'Economica*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
  install -Dm644 "SIL Open Font License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
