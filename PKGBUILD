# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=0.34.2
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('17986ba9b57d9310dc70c392975c3f84befe802392cc7795484af09648605fcc')
sha256sums_armv7h=('df01f4d8ee51e33e539d3f2e175fa13b683e21a74bdf8e9419ae94f98d3ec7ac')
sha256sums_aarch64=('47a6a8d36b1838992fe83c954244dc06504f5ac25950fc4e0b4d234e859b89b1')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
