# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.15
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('e44060850361f51194a031a461335c7005527d8993c66612c03941bb0cb82af4')
sha256sums_armv7h=('827c716b6738e0a248acc40390b206f149cd7de488033c3d1869cf7af71cacf9')
sha256sums_aarch64=('2f49a8d3a31db55cb88978c3332717cc1558411d64501ad66e49cfd7360642c3')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
