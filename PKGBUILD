# Maintainer: Gilwiljam <gillbilljam@gmail.com>
# Contributor: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-geoip-custom
pkgver=202511122214
pkgrel=1
pkgdesc="Custom GeoIP List for V2Ray"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-geoip')
conflicts=('v2ray-geoip')

source=("geoip-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geoip.dat")
sha256sums=('7aa7ba9f96d3d24048bd44ae9182c72b79737c17fdb15d1a070156147c40cdb5')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
