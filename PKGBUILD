# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('980ec9a9cfb1b026080c720b38381889618e505432a72e2e1b7f1025d71b7dea')
sha256sums_armv7h=('5b58df99b356200febc123f47e2144b2a838dbee01d44b75d4b1501395f41918')
sha256sums_aarch64=('7107257d1f544542fa323a5f128ab645f5f4356b2bad6d446c6e80087cd619be')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
