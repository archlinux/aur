# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=parastoo-fonts
pkgver=1.0.0_alpha4
pkgrel=1
pkgdesc="A beautiful Persian font based on Gandom font."
url="https://github.com/rastikerdar/parastoo-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-parastoo')
conflicts=('ttf-parastoo')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver//_/-}/parastoo-font-v${pkgver//_/-}.zip")
sha256sums=('b48e710987d8aeea03b591bd4fe42b4c49ad85dc26385e7448f7f17e8aac723c')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{print,web}/{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}

# vim:set ts=2 sw=2 et:
