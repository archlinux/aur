# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=ttf-choc
pkgver=20090526
pkgrel=2
pkgdesc="Font based on the traditions of Japanese brush calligraphy, thick yet graceful"
arch=('any')
url="https://www.ffonts.net/Choc.font"
license=('unknown')
depends=('fontconfig' 'xorg-fonts-encodings')
source=("$pkgname-$pkgver.zip::${url}.zip")
sha1sums=('27aff590700aebc46b8eb268a619e7e1b2a2a828')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -Dm644 ${srcdir}/choc.ttf  ${pkgdir}/usr/share/fonts/TTF/
}
