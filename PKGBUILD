# Maintainer: lingbopro <lingbopro [at] outlook [dot] com>
pkgname=patchsplit-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI tool to split pull requests into separate patches per commit"
arch=('x86_64')
url="https://github.com/zitzhen/patchsplit"
license=('MIT')
depends=('curl')
provides=('patchsplit')
conflicts=('patchsplit')
source_x86_64=("${url}/releases/download/v${pkgver}/patchsplit-linux-x86_64.tar.gz")
sha256sums_x86_64=('470317b507804f13caab9a35fdf242f0b094e68ae7f8dadd31695e8c874929bd')
package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/patchsplit" "${pkgdir}/usr/bin/patchsplit"
}
