# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=goesimage
pkgver=0.1.0
pkgrel=1
pkgdesc="Download the latest image from a NOAA Geostationary Operational Environment Satellite and set it as the desktop background."
arch=("any")
depends=("feh" "imagemagick" "curl")
license=('custom: Public Domain')
url="https://github.com/pigmonkey/goesimage"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('3e901d20b59351a347f86d8693358a79')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 goesimage "${pkgdir}/usr/bin/goesimage"
}
