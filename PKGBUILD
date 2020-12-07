# Maintainer: suienzan <suienzan at gmail dot com>
_pkgname=mosdns
pkgname=${_pkgname}-bin
pkgver=0.14.0
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
sha256sums=('1f35c5d56fcab0bdaea98d0d5bf7fe13fffc48cf41067598a41a727168c0c355')

package() {
  install -Dm755 mosdns "$pkgdir"/usr/bin/mosdns
}
