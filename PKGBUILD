# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=patchsplit-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI tool to split pull requests into separate patches per commit"
arch=('x86_64')
url="https://github.com/zitzhen/patchsplit"
license=('MIT')
depends=('curl')
provides=('patchsplit')
conflicts=('patchsplit')
source_x86_64=("patchsplit-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/patchsplit-linux-x86_64.tar.gz")
sha256sums_x86_64=('b90e2b9f18d1e5bf637bd9e6e6eb885bf4757cb38c0445f9ce6525de47ced883')
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/patchsplit" "${pkgdir}/usr/bin/patchsplit"
}
