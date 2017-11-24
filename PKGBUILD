# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=parastoo-fonts
pkgver=1.0.0_alpha5
pkgrel=1
pkgdesc="A beautiful Persian font based on Gandom font."
url="https://github.com/rastikerdar/parastoo-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-parastoo')
conflicts=('ttf-parastoo')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver//_/-}/parastoo-font-v${pkgver//_/-}.zip")
sha256sums=('e7459d2b556e30a3bab72f719329d2b92b30ccc9152b59b25645ddb314b1538e')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{print,web}/{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}

# vim:set ts=2 sw=2 et:
