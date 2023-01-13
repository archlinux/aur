# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=xolonium-fonts
pkgver=4.2
pkgrel=1
pkgdesc="Xolonium Fonts created for Xonotic <http://www.xonotic.org>"
arch=('any')
url="https://gitlab.com/sev/xolonium"
license=('custom: SIL Open Font License')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/sev/xolonium/uploads/5f3b4bd40f81e715ea84843747de00e8/${pkgname}-${pkgver}.zip")
sha256sums=('8985f0d71ed1bbfe9df6b7f967fa0a5dec14e9702872c67c4c2a833427abdb77')

package() {
  install -m 0755 -d "${pkgdir}/usr/share/fonts/xolonium"
  install -m 0644 -p otf/*.otf "${pkgdir}/usr/share/fonts/xolonium"
  install -m 0644 -p ttf/*.ttf "${pkgdir}/usr/share/fonts/xolonium"
  install -Dm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/FONTLOG"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
