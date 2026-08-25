# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=patchsplit-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI tool to split pull requests into separate patches per commit"
arch=('x86_64')
url="https://github.com/zitzhen/patchsplit"
license=('MIT')
depends=('curl')
provides=('patchsplit')
conflicts=('patchsplit')
source_x86_64=("${url}/releases/download/v${pkgver}/patchsplit-linux-x86_64.tar.gz")
sha256sums_x86_64=('19d19cdb675a97b7560c9ef0194cc605d5b19232c68541693e2d5d7e00d6faef')
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/patchsplit" "${pkgdir}/usr/bin/patchsplit"
}
