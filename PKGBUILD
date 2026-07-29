# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('0cd678b420efc175421573fc0164b273cc484b017a453d3ac5966f0b5294313e')
sha256sums_armv7h=('6fed9930efd22039a3e4fc185f86c6dcb5a7e687c5a47a35a850b70b8e7c18e5')
sha256sums_aarch64=('810cb1207092f93992aa0d09327e87ec40f623a8e16da5582562aba66c0d17fb')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
