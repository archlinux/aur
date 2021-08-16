# Maintainer: so1ar <674630130@qq.com>

pkgname=v2ray-geoip-custom
pkgver=202108120043
pkgrel=1
pkgdesc="Custom GeoIP List for V2Ray"
arch=('any')
url="https://github.com/Loyalsoldier/geoip"
license=('CCPL:by-sa')
provides=('v2ray-geoip')
conflicts=('v2ray-geoip')

source=("geoip-$pkgver.dat::https://github.com/Loyalsoldier/geoip/releases/download/$pkgver/geoip.dat")
sha256sums=('dc4ffc313bf7836fbc0c5fbbca1c2a89fd8fde801240f44ff2f108e1a6fdf092')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
