# Maintainer: Spiros Georgaras <sng@hellug.gr>
pkgname=ttf-sk-polytonic-fonts
pkgver=1
pkgrel=3
pkgdesc="Greek polytonic fonts by Spiros Krontiris"
arch=('any')
license=('custom')
url="http://www.enoriaka.gr"
depends=()
source=('http://members.hellug.gr/sng/AUR/ttf-sk-polytonic-fonts.tar.gz')
md5sums=('bccb32b5c0e1d8c1b01feccb44b1dca6')
install=${pkgname}.install

package() {
install -d ${pkgdir}/usr/share/fonts/TTF
install -Dm644 ${srcdir}/*/*.ttf ${pkgdir}/usr/share/fonts/TTF/
install -d ${pkgdir}/usr/share/licenses/ttf-sk-polytonic-fonts
install -Dm644 ${srcdir}/*/license ${pkgdir}/usr/share/licenses/ttf-sk-polytonic-fonts/license
}
