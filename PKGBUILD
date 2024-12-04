# Maintainer: wangyifan <wangyifan@acoinfo.com>

pkgname=ecs
pkgver=0.0.1
pkgrel=1
pkgdesc='A command-line tool for create SylixOS container written in go.'
arch=(any)
url='https://github.com/wyf9661/ecs.git'
license=(MIT)
provides=("${pkgname}")
source=(git+${url}#tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  go build
}

package() {
  cd "${pkgname}"
  install -Dm755 ${pkgname} -t "${pkgdir}/usr/bin/"
}

