# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8-alt
pkgver=1.0
pkgrel=1
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use. Based on the more peculiar glyph forms of the reference fonts."
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-8-alt.otf")
sha512sums=('bfcfd61adf58b75c79bd600818d9ca9c21d9fdfeb851d849d36f8311d7bc4ec92ba0e0485256a258eca208d633a4c70a3f2cd8d6eddba00ba823931efba987e9')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8-alt.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8-alt.otf"
}

# vim:set ts=2 sw=2 et:
