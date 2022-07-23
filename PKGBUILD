# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=v2ray-domain-list-custom
pkgver=202207222212
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/Loyalsoldier/v2ray-rules-dat"
license=('GPL3')
provides=('v2ray-domain-list-community')
conflicts=('v2ray-domain-list-community')

source=("geosite-$pkgver.dat::https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$pkgver/geosite.dat")

sha256sums=('c6191d09bcc4d680a209535e5afb14fcab330c6faad8a3c2fa86afa48c7618b5')

package() {
  install -Dm644 geosite-$pkgver.dat "$pkgdir"/usr/share/v2ray/geosite.dat
}
