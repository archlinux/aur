# Maintainer: wangyifan <wangyifan@acoinfo.com>

pkgname=ecs
pkgver=0.0.2
pkgrel=1
pkgdesc='A command-line tool for create SylixOS container written in go.'
arch=(any)
url='https://github.com/wyf9661/ecs'
license=(MIT)
provides=("${pkgname}")
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha1sums=('2b31da9e88a846b74fb1e74aa685ddad2df62df3')

build() {
  cd "${pkgname}-${pkgver}"
  go build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} -t "${pkgdir}/usr/bin/"
}

