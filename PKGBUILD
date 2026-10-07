# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=patchsplit-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="CLI tool to split pull requests into separate patches per commit"
arch=('x86_64')
url="https://github.com/zitzhen/patchsplit"
license=('MIT')
depends=('curl')
provides=('patchsplit')
conflicts=('patchsplit')
source_x86_64=("patchsplit-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/patchsplit-linux-x86_64.tar.gz")
sha256sums_x86_64=('eac538c61e15cad950d9eb8e4e150fc19f34f991f37f8e29992531224e65ca55')
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/patchsplit" "${pkgdir}/usr/bin/patchsplit"
}
