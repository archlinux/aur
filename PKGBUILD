# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-quintessential
pkgver=1
pkgrel=1
pkgdesc='Calligraphic typeface from Google by Brian J. Bonislawsky'
arch=('any')
url='https://fonts.google.com/specimen/Quintessential'
license=('SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install="${pkgname}.install"
source=('https://github.com/google/fonts/raw/master/ofl/quintessential/Quintessential-Regular.ttf')
sha256sums=('73d192f10dbfc716214aae282afb93036f12415d16adc9d6d0e981f34d829d32')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
