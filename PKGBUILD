# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-domain-list-custom
pkgver=202203182211
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geosite.dat")

sha256sums=('f44a18081318451b505b7b57981c51290977a655a199dbfd90d3a1ee9300d24d')

package() {
  install -Dm644 geosite-$pkgver.dat "$pkgdir"/usr/share/v2ray/geosite.dat
}
