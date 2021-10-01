# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-geoip-custom
pkgver=202109302210
pkgrel=1
pkgdesc="Custom GeoIP List for V2Ray"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-geoip')
conflicts=('v2ray-geoip')

source=("geoip-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geoip.dat")
sha256sums=('6f529312eeb8477f66b1828a35844b96f4d831e6f1b361e57a4f4892b733c247')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
