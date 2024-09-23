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
sha256sums_x86_64=('a03bbc3e7d21b3185c61ba840684682b95900ca04b76fbb578686deeb2262d46')
sha256sums_armv7h=('f841fea42872ad0c70232d813e2f5325944d9d337864d53c40ecfa703defba2e')
sha256sums_aarch64=('574ddcb8c6f3f9f51d1b4ebe85e8285db9eb26da8d479a57322fa6edcbd18331')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
