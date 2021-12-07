# Maintainer: Akatsuki Rui <akiirui@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip-lite
pkgver=202112061314
pkgrel=1
pkgdesc="GeoIP List for V2Ray (only-cn-private version)"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CCPL:by-sa')
provides=("v2ray-geoip")
conflicts=("v2ray-geoip")
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip-only-cn-private.dat")
b2sums=('2eb66970847727a26080bb866e1865777e905b966e4a5f2e5acb0d03c97bbaf8d335bdd056b8457372f552081311ec89a634d158d2e3fba88f8764701350ed08')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
