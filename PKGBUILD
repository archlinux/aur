# Maintainer: moviuro <moviuro.aur@popho.be>

pkgname=ttf-goldmansans
pkgver=2020.06.23
pkgrel=1
#pkgdesc="Goldman Sans is a custom typeface designed for the needs of digital finance."
arch=('any')
url="https://design.gs.com/d/design-system/foundation/typography/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=('https://design.gs.com/d/GoldmanSans.zip')
sha512sums=('986c32d0611de90720243d87420bb3dc2fec8279d60921e17285cc0b6d8ac53547eb2b8d4d4785ad91024b7ca4bfe2ba4bd3ae7435bb77630a2fab051a214d37')

package() {
  find "$srcdir/GoldmanSans/" -name '*.ttf' | xargs install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 "$srcdir/GoldmanSans/License.pdf" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
