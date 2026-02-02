# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/DumbNoxx/Goxe"
license=('Apache-2.0')

source_x86_64=("https://github.com/DumbNoxx/Goxe/releases/download/v${pkgver}/Goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/Goxe/releases/download/v${pkgver}/Goxe_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('a74b12841d888a0425a777379c6e555fcff7275f6264c1b92397091f1743e03c')
sha256sums_aarch64=('1e05a553ee6523d6197ca40be8300c3bd22aa9678f67d0ccf76e7e91f36f3f85')

package() {
  install -Dm755 "${srcdir}/Goxe" "${pkgdir}/usr/bin/goxe-bin"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
