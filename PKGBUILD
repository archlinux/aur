# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('37da2a35c6cece3688b966b0cf967835c484197e59fef9482eb0eb8d1d84ca07')
sha256sums_armv7h=('81c5d001f2ccec41f24a3de4d743c0d3665f254bdc9cbc463acf515beeca83e4')
sha256sums_aarch64=('ac191583ac2f3059b8b814c7bb02722792924504ab04b4ceddc4989d38e06e76')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
