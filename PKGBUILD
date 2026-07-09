# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e18c00436327c6fe3fb8961443ff90912ba388b4acef8e150e5783c523ecdbac')
sha256sums_aarch64=('d0fe19ddacb590076d2b5f83e0fef8f7dfdc6804d10e6443e12c4ac787c62d9f')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
