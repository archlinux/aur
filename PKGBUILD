# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-16-full
pkgver=1.0
pkgrel=1
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use. Full unicode support."
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-16-full.otf")
sha512sums=('01fc4ea0e64759363e4248670856b74c8b2e6dbb6d9fcaa238aed444219110e138e0bb6ca2b941493d672fdc480d22222e8c6ec6e9685e2ffdd7285ed6d301ae')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-16-full.otf" "$pkgdir/usr/share/fonts/OTF/unscii-16-full.otf"
}

# vim:set ts=2 sw=2 et:
