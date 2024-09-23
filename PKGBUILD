# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.10
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('49fe515cf145b808e21c140d6cf17e0fe88f2c91819d8b61f9763ba5eadb81c2')
sha256sums_armv7h=('a60b07f4ef521d39cf5fd6713e1405bff6277f5da95df69c71d5a0b1f07bca3a')
sha256sums_aarch64=('0245254a8ce9ab76de0474483d1c62492c7a6abb4229cdbd3e12d2982686f23e')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
