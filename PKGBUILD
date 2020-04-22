# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dockerfile-generator-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Generates dockerfiles based on various input channels"
arch=('x86_64')
url='https://github.com/ozankasikci/dockerfile-generator'
license=('GPL-3.0')
provides=("${pkgname%-bin}" 'dfg')
makedepends=('go-pie')
source=("${url}/releases/download/v${pkgver}/dfg_v${pkgver}_linux_amd64")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/"dfg* "${pkgdir}/usr/bin/dfg"
}