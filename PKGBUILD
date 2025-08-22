# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>

pkgname=openziti-bin
pkgver=1.6.7
pkgrel=1
pkgdesc='An open source zero trust network'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://openziti.io'
license=('Apache-2.0')
source_x86_64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-amd64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/openziti/ziti/releases/download/v${pkgver}/ziti-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=('85e940bd340db61aaf16a533e899ea9cf3bcaf318ebda28e433a88fefe698b61')
sha256sums_armv7h=('fc29073292f30e4b8a949d8d25d0876f6fbeee1bf2daf4f42acb81b3e64f36f0')
sha256sums_aarch64=('c5760cd02c15c429876f0188ce446ef2d9592cbfcff9bcc036b733bdd032128e')


package() {
  install -D -m 0755 ziti "${pkgdir}/usr/bin/ziti"
}
