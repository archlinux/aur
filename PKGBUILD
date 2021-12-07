# Maintainer: Akatsuki Rui <akiirui@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip-lite
pkgver=202112061314
pkgrel=2
pkgdesc="GeoIP List for V2Ray (only-cn-private version)"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CCPL:by-sa')
provides=("v2ray-geoip")
conflicts=("v2ray-geoip")
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip-only-cn-private.dat")
b2sums=('8c5ecf2128dd1cebd68d544ba130928902cdc5d2fd878fe5ee7a0bf625582c550f96abf9d544d218310a942017b8985e61a61df799926228e48b13fee142b709')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
