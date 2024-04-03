# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=0.34.1
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64')
url='https://openziti.io'
license=('Apache-2.0')
source=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
sha256sums=('264baf16c64af3dbedcc520d460d591e9629fe25c2e9ce7d423f5fcc102213cd')

package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
