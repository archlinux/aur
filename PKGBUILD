# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.11
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('41a4c80a2d557c1b1f8b363b277feb8763b78f2708ada64f4316e281af30e535')
sha256sums_armv7h=('9caa76e1f685fc31e1cfb371c8601ed9a15dca6b5acc5083f7f10793d7268e4b')
sha256sums_aarch64=('574ddcb8c6f3f9f51d1b4ebe85e8285db9eb26da8d479a57322fa6edcbd18331')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
