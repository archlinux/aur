# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.4.3
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('cda287ecb59e7e40843c67bb074a9887ef5b4dec8bd9309aad9b9795910b7a7f')
sha256sums_armv7h=('0acd13b9f86573ff6b3bcd344f357f1e35bbcda20bbb1dc6b918ec513c7c8c31')
sha256sums_aarch64=('219ede0e299b07109e43df36b1be08d648f12eaf251f719ee418c831f618a7c3')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
