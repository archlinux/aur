# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

_fontname=economica
pkgname=ttf-${_fontname}
pkgver=20170522
pkgrel=1
pkgdesc="A very condensed type. Accomplishes horizontal compression while keeping a strong personality."
arch=("any")
url="https://www.fontsquirrel.com/fonts/economica"
license=("custom:OFL")
depends=("fontconfig" "xorg-font-util")
conflicts=("otf-${_fontname}")
source=("https://www.1001fonts.com/download/${_fontname}.zip")
install=${pkgname}.install
md5sums=('SKIP')

package() {
  find . -name 'Economica*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
  install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
