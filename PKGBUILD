# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-fonts
pkgver=20.1.0
pkgrel=1
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://github.com/rastikerdar/vazir-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir')
conflicts=('ttf-vazir')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-font-v${pkgver}.zip")
sha256sums=('843f6bfbc7c214ab339f3e7a555bfeb20c6ddebbe3885a33a2c3b4098cf64576')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
