# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=patchsplit-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="CLI tool to split pull requests into separate patches per commit"
arch=('x86_64')
url="https://github.com/zitzhen/patchsplit"
license=('MIT')
depends=('curl')
provides=('patchsplit')
conflicts=('patchsplit')
source_x86_64=("${url}/releases/download/v${pkgver}/patchsplit_${pkgver}-1.ubuntu26.04.1_amd64.deb")
sha256sums_x86_64=('10beee2fb10e969d8fde47d59c14737611e9199bdb7384c50490635aebb37f4f')
package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"
}
