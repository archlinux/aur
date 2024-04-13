# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('b945f9bc7bbf09ed08abfc9e7d7bbf7a3601238547b4b962edb36094d02325ed')
sha256sums_armv7h=('5b9e8d0b3222ed0850d735a7b35041a6da1220b3c5b27b2787fa7bab529172bf')
sha256sums_aarch64=('43f101491bc1925f3cad4f7c992dfa39c526c0134fc99651630dfdd85aef4d61')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
