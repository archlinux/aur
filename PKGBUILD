# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-domain-list-custom
pkgver=202109302210
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geosite.dat")

sha256sums=('6d4bbb7490721f1cad528c3b59d78a7f2d22d0932b0f56bea427b56cd1cb4723')

package() {
  install -Dm644 geosite-$pkgver.dat "$pkgdir"/usr/share/v2ray/geosite.dat
}
