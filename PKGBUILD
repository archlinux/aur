# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.4
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('a5092de3d7da4e9d3e80322e7b99ba178abef555607c6cbeb8b0e41a833deab0')
sha256sums_armv7h=('e10ce763b65ca0b1d8056da467e082e133632795cca8827c74cf194b3ef7905a')
sha256sums_aarch64=('de096ff35501adc2d533cc2e689731a1fd20e9e5d714bd7bc02083b32421fa8c')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
