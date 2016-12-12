# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=xolonium-fonts
pkgver=4.1
pkgrel=1
pkgdesc="Xolonium Fonts created for Xonotic <http://www.xonotic.org>"
arch=('any')
url="https://fontlibrary.org/en/font/xolonium"
license=('custom: SIL Open Font License')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-font')
install=${pkgname}.install
source=("xolonium-${pkgver}.zip::https://fontlibrary.org/assets/downloads/xolonium/e00c124f3e1b130e5ec2a7eee2f4f1b8/xolonium.zip")
sha256sums=('c3fe7355675f40c0f66379e772a0b0a1e4c346eb43b6b719cf160a61d3b0b046')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 otf/Xolonium-Bold.otf "${pkgdir}/usr/share/fonts/OTF/Xolonium-Bold.otf"
  install -Dm644 otf/Xolonium-Regular.otf "${pkgdir}/usr/share/fonts/OTF/Xolonium-Regular.otf"
  install -Dm644 ttf/Xolonium-Bold.ttf "${pkgdir}/usr/share/fonts/TTF/Xolonium-Bold.ttf"
  install -Dm644 ttf/Xolonium-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/Xolonium-Regular.ttf"
  install -Dm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/FONTLOG"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
