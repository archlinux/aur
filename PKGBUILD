# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-domain-list-custom
pkgver=202301062210
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geosite.dat")

sha256sums=('5685a13939d4b5fcbbf7ae5f10eb6c0526b614639b6542f2fb929ca63306c5d2')

package() {
  install -Dm644 geosite-$pkgver.dat "$pkgdir"/usr/share/v2ray/geosite.dat
}
