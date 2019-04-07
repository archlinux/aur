# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=samim-fonts
pkgver=3.1.0
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
sha256sums=('89ce35c5057c9b700890800980ed8b6edebc57f5a8087682c14c96fc4012b00f')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
