# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=tanha-fonts
pkgver=0.9
pkgrel=1
pkgdesc="A beautiful Persian font based on Samim and Vazir font."
url="https://rastikerdar.github.io/tanha-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-tanha')
conflicts=('ttf-tanha')
source=("${pkgname}-${pkgver}.zip::https://github.com/rastikerdar/tanha-font/releases/download/v${pkgver}/tanha-font-v${pkgver}.zip")
sha256sums=('ab3c2ed8337aacd2945ac132287cd0b1bba3cead265d82126f6e52ae7a752f09')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Tanha*.ttf
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Tanha*.ttf
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
