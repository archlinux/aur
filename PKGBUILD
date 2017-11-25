# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=shabnam-fonts
pkgver=2.2.0
pkgrel=1
pkgdesc="A beautiful Persian font based on Vazir font."
url="https://github.com/rastikerdar/shabnam-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-shabnam')
conflicts=('ttf-shabnam')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/shabnam-font-v${pkgver}.zip")
sha256sums=('399d823813bba9bbdc65771b517a049451825e26d19ce212716527b70b75e1da')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
