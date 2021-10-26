# Maintainer: John Beard <john dot j dot beard at gmail dot com>
# Author: Peter Wiegel <wiegel at peter-wiegel dot de>

pkgname=tgl-ttf
pkgver=1.0
pkgrel=4
url="https://www.1001fonts.com/tgl-font.html"
license=('custom:SIL Open Font License v1.1')
pkgdesc='TGL DIN ISO custom font'
arch=('any')
source=("https://dl.1001fonts.com/download/tgl.zip")
depends=('fontconfig' 'xorg-font-utils')
md5sums=('84e185e597f39e0a6629179fa2b0da5e')

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 "${srcdir}"/TGL\ *.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 "Open Font License.txt" "${pkgdir}"/usr/share/licenses/${pkgname}/
}

