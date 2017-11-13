# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=vazir-fonts
pkgver=16.1.0
pkgrel=2
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://github.com/rastikerdar/vazir-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir')
conflicts=('ttf-vazir')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-font-v${pkgver}.zip")
sha256sums=('acd48aafe25b0b3f740b9136d7f4f73a184743d61c593016a3e34c92fabdc0a5')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
