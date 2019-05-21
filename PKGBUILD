# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=goesimage
pkgver=0.1.1
pkgrel=1
pkgdesc="Download the latest image from a NOAA Geostationary Operational Environment Satellite and set it as the desktop background."
arch=("any")
depends=("feh" "imagemagick" "curl")
license=('custom: Public Domain')
url="https://github.com/pigmonkey/goesimage"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pigmonkey/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('6bfe92171d808942c0a256486fa957a5')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 goesimage "${pkgdir}/usr/bin/goesimage"
}
