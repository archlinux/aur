# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=vazir-fonts
pkgver=21.0.1
pkgrel=1
pkgdesc="A beautiful Persian font based on DejaVu font."
url="https://github.com/rastikerdar/vazir-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-vazir')
conflicts=('ttf-vazir')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/vazir-font-v${pkgver}.zip")
sha256sums=('18c9e5c1f58e17ae76b80fc15793c3f99e548b56e0b839b9c2cf4c8a3ac135f3')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
