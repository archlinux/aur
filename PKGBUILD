# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=patchsplit-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A fast, cross-platform CLI tool for splitting and applying patches (upstream prebuilt binaries)"
arch=('x86_64')
url="https://github.com/zitzhen/patchsplit"
license=('MIT')
depends=('curl')
provides=('patchsplit')
conflicts=('patchsplit')
source_x86_64=("${url}/releases/download/v${pkgver}/patchsplit_${pkgver}-1.ubuntu26.04.1_amd64.deb")
sha256sums_x86_64=('3729fa6b030bde884e871dc7050b99bee31ac946b6029d89d79351d671d2beab')
package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"
}
