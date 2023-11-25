# Maintainer: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8-mcr
pkgver=2.1
pkgrel=1
pkgdesc="Based on retrofuturistic MCR-like 8x8 fonts used in various games, demos, etc"
url="http://viznut.fi/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://viznut.fi/unscii/unscii-8-mcr.otf")
sha512sums=('a6705da26c4a548a9292ccb215788c6f1a787bf9078bef0747f792ad555182f46c284c2c5107af6f4a01e1e14a95e658c77b33625f4f1af5fe87c6f751ec6808')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8-mcr.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8-mcr.otf"
}

# vim:set ts=2 sw=2 et:
