# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-geoip-custom
pkgver=202202242211
pkgrel=1
pkgdesc="Custom GeoIP List for V2Ray"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-geoip')
conflicts=('v2ray-geoip')

source=("geoip-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geoip.dat")
sha256sums=('85288951c6153872d4cc3c01d41aa7de9f6b8407074b6a0e0ccfc7ed953247e8')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
