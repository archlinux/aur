# Maintainer: so1ar <674630130@qq.com>

pkgname=v2ray-domain-list-custom
pkgver=20210814110437
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/Loyalsoldier/domain-list-custom"
license=('MIT')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-$pkgver.dat::https://github.com/Loyalsoldier/domain-list-custom/releases/download/$pkgver/geosite.dat"
	"https://raw.githubusercontent.com/Loyalsoldier/domain-list-custom/master/LICENSE")

sha256sums=('5709957117e9a72251a7016a362b8c6a9e8505bc864343f70a64a0d087acf9b3'
            '35f18e0331a1ecd1835400c50e3b367c2ce09f6c13d91c4a0f3cb11f71d3bbc3')

package() {
  install -Dm644 geosite-$pkgver.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
