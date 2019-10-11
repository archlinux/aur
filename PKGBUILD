# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=samim-fonts
pkgver=4.0.2
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
sha256sums=('18f07b60191d1f9ff8b93b322de2490ac4ba2f7b10c5dcdce9d4caa329769918')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
