# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-geoip-custom
pkgver=202302162210
pkgrel=1
pkgdesc="Custom GeoIP List for V2Ray"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-geoip')
conflicts=('v2ray-geoip')

source=("geoip-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geoip.dat")
sha256sums=('8c551007179ca65f37ffbabdca9a4de8aa7ccb92223380c4f86d3c46f1f0fc35')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
