# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=0.33.1
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64')
url='https://openziti.io'
license=('Apache-2.0')
source=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
sha256sums=('6b7a9e5da7e679fb5eea4ce91220ed235d2bff5083ece2db57533ed315f70566')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
