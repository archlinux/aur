# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-domain-list-custom
pkgver=202110212210
pkgrel=2
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geosite.dat")

sha256sums=('c48d87e49e3c993c19d91552c304f6c043b8a0fd968f56807fb4edc173276193')

package() {
  install -Dm644 geosite-$pkgver.dat "$pkgdir"/usr/share/v2ray/geosite.dat
}
