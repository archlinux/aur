# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=shabnam-fonts
pkgver=2.1.1
pkgrel=2
pkgdesc="A beautiful Persian font based on Vazir font."
url="https://rastikerdar.github.io/shabnam-font/"
arch=(any)
license=('OFL')
depends=('fontconfig')
provides=('ttf-shabnam')
conflicts=('ttf-shabnam')
source=("${pkgname}-${pkgver}.zip::https://github.com/rastikerdar/shabnam-font/releases/download/v${pkgver}/shabnam-font-v${pkgver}.zip")
sha256sums=('1a116e9648cb6df10bb387c821df5149fcc7deb1ef8883ace3ca3805b892ab85')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./Shabnam*.{eot,ttf,woff{,2}}
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./{Farsi*,Without-Latin}/Shabnam*.{eot,ttf,woff{,2}}  
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
