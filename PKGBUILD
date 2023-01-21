# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-geoip-custom
pkgver=202301202210
pkgrel=1
pkgdesc="Custom GeoIP List for V2Ray"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-geoip')
conflicts=('v2ray-geoip')

source=("geoip-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geoip.dat")
sha256sums=('4d0b01b8bffe7eb3e4bf55ac9e3d0f7982f05ce3cdb92b485a0bd48bc860c48e')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
