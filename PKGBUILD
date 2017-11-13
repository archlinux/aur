# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=shabnam-fonts
pkgver=2.1.1
pkgrel=3
pkgdesc="A beautiful Persian font based on Vazir font."
url="https://github.com/rastikerdar/shabnam-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-shabnam')
conflicts=('ttf-shabnam')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/shabnam-font-v${pkgver}.zip")
sha256sums=('1a116e9648cb6df10bb387c821df5149fcc7deb1ef8883ace3ca3805b892ab85')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
