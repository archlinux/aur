# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=tanha-fonts
pkgver=0.10
pkgrel=2
pkgdesc="A beautiful Persian font based on Samim and Vazir font."
url="https://github.com/rastikerdar/tanha-font"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-tanha')
conflicts=('ttf-tanha')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/tanha-font-v${pkgver}.zip")
sha256sums=('5707650a2e7ee0e669bfdcb94b93de92a5c55a37257030d39a5b854b19864547')

package() {
  install -Dt "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" -m644 ./{,**/}*.ttf
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 ./LICENSE
}
# vim:set ts=2 sw=2 et:
