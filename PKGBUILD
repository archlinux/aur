# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.9
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('28aad501e576c30b0915eb9f3077f7605c048b278a639d2ef3e5fb8f2f0d7e94')
sha256sums_armv7h=('e50f3635d4387cc6fd124d60981e4099236865d9975f1edb9186214b73a70d8d')
sha256sums_aarch64=('4fbc48b28a980602be85c961ae09dca5c5840be686349943510f09c016e04882')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
