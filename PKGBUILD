# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.3.3
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('aeb9b3a348ba5a661a94204f74e06db5f3c3df585e15279baa1eb99ceb267b1c')
sha256sums_armv7h=('393d9b91ba96f3b9db3a2c0dfbbd464f8db38a936ecf8ca8c480239e3d89564c')
sha256sums_aarch64=('fc24d5e2908873892209c91416bb3b9e90fba79f8fad5b46737235ee8630ea53')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
