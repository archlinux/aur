# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-fonts
pkgver=20.1.1
pkgrel=1
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://github.com/rastikerdar/vazir-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir')
conflicts=('ttf-vazir')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-font-v${pkgver}.zip")
sha256sums=('b4e1d37ecf7112f78be4a74aefff1fc83576c4d3e3690261c30779ab78db0709')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
