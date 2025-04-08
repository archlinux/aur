# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.5.4
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('d8cb1a1ded24ca05f39360ddd49ba1c0f2bb5292eb5fd2fcd739b82758507463')
sha256sums_armv7h=('5d01fecc260c3dc4a25b8feb7c7e4b465c354e01d5ceaf7829e2d439960fb57c')
sha256sums_aarch64=('3cc85e48ebb9f7ed29f92acc118e66792995817782295f89dbdd3281ab1e7f97')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
