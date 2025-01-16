# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.16
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('a2031f3685bb0e5ca61963ed05ff86f486024479a36a5fd87f494a077364dfa8')
sha256sums_armv7h=('9ca91feb57298f7436449bcaab3738a327e2056ea74274300f54f7e561d1aeb4')
sha256sums_aarch64=('f7cb20574e2c15ae3c4187238b62a60318d6e4bd9e4c512f803bc16e2767eb87')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
