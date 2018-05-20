# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=shabnam-fonts
pkgver=3.1.0
pkgrel=1
pkgdesc="A beautiful Persian font based on Vazir font."
url="https://github.com/rastikerdar/shabnam-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-shabnam')
conflicts=('ttf-shabnam')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/shabnam-font-v${pkgver}.zip")
sha256sums=('dec8485e6b161778f414d68029609ae4e355c274b3dbb791ee936098deabe371')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
