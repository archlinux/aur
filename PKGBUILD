# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8-mcr
pkgver=1.0
pkgrel=1
pkgdesc="Based on retrofuturistic MCR-like 8x8 fonts used in various games, demos, etc"
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-8-mcr.otf")
sha512sums=('6fa4ed2284a0ddabc5da6790c745acbd377683291049a902ef0f965ad1ed88abd73b86049335dc835331d82593197e30bccaaf6b0f340993ba03d186c4cefe3c')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8-mcr.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8-mcr.otf"
}

# vim:set ts=2 sw=2 et:
