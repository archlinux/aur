# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=samim-fonts
pkgver=4.0.0
pkgrel=1
pkgdesc="A beautiful Persian font based on Vazir font."
url="https://github.com/rastikerdar/samim-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-samim' "$pkgname")
conflicts=('ttf-samim' "$pkgname")
replaces=('ttf-samim')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/samim-font-v${pkgver}.zip")
sha256sums=('d44bb14116015ec0ebb3adaca3d7b8490e97fd50aca3dddc9ac3e3c711dddc3a')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
