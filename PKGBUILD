# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('f4496844d32b78857c1adc83252cd001c842c7f4bd4865fd177d832351de536c')
sha256sums_armv7h=('9e726d0992935ca146e1c80ad221b908553a70fbca80eb18ad7c8e05aa81556c')
sha256sums_aarch64=('41d303a6327ec6db42c006f417a7b0859dba3ead263b76dfa75c82f4b06818a2')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
