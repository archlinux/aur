# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.6.8
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('19337a08ef339d4b5d35fca42f124bb3c1d31cd989ccd0b97502ec940aeb8796')
sha256sums_armv7h=('919faf334c82d49aa555f89fa1e13b9dd92db850bc09a8b17831a0f0dd4e0b81')
sha256sums_aarch64=('d85a46c6aa4aff0a751cfea55071e5ca7f39604b59861dc696e6721109fc24c7')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
