# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=nba-go-bin
pkgver=0.4.0
pkgrel=2
pkgdesc='The finest NBA CLI'
arch=('x86_64')
url="https://github.com/xxhomey19/nba-go"
license=('MIT')
provides=('nba-go')
source=("${url}/releases/download/v${pkgver}/nba-go-linux")
md5sums=('faa57d5a1af9690c636aee6a2cfc245f')

package() {
  install -Dm755 "${srcdir}"/nba* "${pkgdir}/usr/bin/nba-go"
}
# vim:set ts=2 sw=2 et: