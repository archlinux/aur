# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=samim-fonts
pkgver=4.0.3
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
sha256sums=('a12206e9b1d0c99a061e115193ea45f402ea4c5cfcc40108d8c317e790e34866')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
