# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0bc0769d1b4e78beb5d8051611d115c470279ec8014cdd4a0fdfa4b055e6e2d2')
sha256sums_aarch64=('d571379d66e6685c962758070f7261fb90b27a0ab4cf4a6be2d0403369f439d4')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
