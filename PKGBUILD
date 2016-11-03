# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=xolonium-fonts
pkgver=4.0
pkgrel=1
pkgdesc="Xolonium Fonts created for Xonotic <http://www.xonotic.org>"
arch=('any')
url="https://fontlibrary.org/en/font/xolonium"
license=('custom: SIL Open Font License')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-font')
install=${pkgname}.install
source=("xolonium-${pkgver}.zip::https://fontlibrary.org/assets/downloads/xolonium/38b086e531b4f1562471bbcec9ff61c9/xolonium.zip")
sha256sums=('045e2c4411f3e3d8eb60a98fafaad8672328f0224b17667a9927d0b2699e50e1')

package() {
  cd "${pkgname}-${pkgver}"
	install -Dm644 otf/Xolonium-Bold.otf "${pkgdir}/usr/share/fonts/OTF/Xolonium-Bold.otf"
  install -Dm644 otf/Xolonium-Regular.otf "${pkgdir}/usr/share/fonts/OTF/Xolonium-Regular.otf"
  install -Dm644 ttf/Xolonium-Bold.ttf "${pkgdir}/usr/share/fonts/TTF/Xolonium-Bold.ttf"
  install -Dm644 ttf/Xolonium-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/Xolonium-Regular.ttf"
  install -Dm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/FONTLOG"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
