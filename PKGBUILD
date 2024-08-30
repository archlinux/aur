# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.8
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('c655eab3ece0883ca34dd627fcba4c1cfc161d8197e43184443a6b92531c25d9')
sha256sums_armv7h=('2b8b5bfca1b74a3dc7fc3320be9119f6381e52230c816d9f4933cbc7e1185f8f')
sha256sums_aarch64=('b2b75c661a3a2aab8771fe1277d4b21e4eb6796f3c57a1b362a4f359fb5f32b4')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
