# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.6.12
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('76b5737df55055c09321ad4014bcb0d3cc1cf3df6fa55d938814d8adab4ed73a')
sha256sums_armv7h=('a0abfbab944b00ba861701c3d12c4e9618ace9d2804982131a0b84cbe671a2d9')
sha256sums_aarch64=('9cec4e65e6ec27a7eda23e009f9e2a5c9154374f13f3ad4a74861c37f1ac9b4a')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
