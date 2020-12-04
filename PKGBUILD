 
# Maintainer: Midori <suienzan at gmail dot com>
_pkgname=mosdns
pkgname=${_pkgname}-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Plug-in configured DNS forwarder/server"
arch=('x86_64')
url="https://github.com/IrineSistiana/mosdns/"
license=('GPL3')
optdepends=('v2ray-domain-list-community: geosite.dat'
            'v2ray-geoip: geoip.dat')
provides=('mosdns')
conflicts=('mosdns' 'mosdns-git')
source=("https://github.com/IrineSistiana/mosdns/releases/download/v${pkgver}/mosdns-linux-amd64.zip")
sha256sums=('bbbdaeb82fbb8c40a0d9bbc5a5e4ae2098b39992336d948f86b53b1e2881062b')

package() {
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
}
