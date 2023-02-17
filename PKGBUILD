# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=goesimage
pkgver=0.1.4
pkgrel=1
pkgdesc="Download the latest image from a NOAA Geostationary Operational Environment Satellite and set it as the desktop background."
arch=("any")
depends=("feh" "imagemagick" "curl")
license=('custom: Public Domain')
url="https://github.com/pigmonkey/goesimage"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('bae76e41871aba72542ea903c5ac61cc2934f8ebb2c4745407bc04d8272f3c82')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 goesimage "${pkgdir}/usr/bin/goesimage"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
