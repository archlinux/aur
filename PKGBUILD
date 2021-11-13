# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-geoip-custom
pkgver=202111122210
pkgrel=1
pkgdesc="Custom GeoIP List for V2Ray"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-geoip')
conflicts=('v2ray-geoip')

source=("geoip-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geoip.dat")
sha256sums=('44b741f445a6bbacfd83b837fbb1741ecce1359e9ef5aa243746a9f1570fe411')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
