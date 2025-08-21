# Maintainer: 0x4A4FRN <dfntlynotjon@gmail.com>

pkgname=zigmod-bin
pkgver=r98
pkgrel=1
epoch=1
pkgdesc="A package manager for the Zig programming language"
url="https://github.com/nektro/zigmod"
license=('MIT')
arch=('x86_64')
provides=('zigmod')
conflicts=('zigmod')
source=(
  "${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/zigmod-x86_64-linux"
)
sha256sums=('88200886180833b1cd684ec4dfd7ccf6c10d72d93cb45851e6e91f8233e6ec6c')

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/zigmod"
}
