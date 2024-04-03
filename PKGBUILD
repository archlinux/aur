# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=0.34.1
pkgrel=2
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('264baf16c64af3dbedcc520d460d591e9629fe25c2e9ce7d423f5fcc102213cd')
sha256sums_armv7h=('d863e85db337106de8c5649104a075a0a5ca7ee4cde6f85551590f8083202d7e')
sha256sums_aarch64=('876f9280c8f2f47cfac3459426f6e4517c5ff74d117bfbfdc6018b0140507c98')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
