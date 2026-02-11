# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/DumbNoxx/Goxe"
license=('Apache-2.0')

source_x86_64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/goxe/releases/download/v${pkgver}/goxe_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('41afc601435045e94ccb61adad5d5bfba21d5fd808a8c46592e798ea336101e5')
sha256sums_aarch64=('2b8181b60a893c42e108e92a3eb6ad26ab98ba624b4d1f3d1ac6a1c78029efa6')

package() {
  install -Dm755 "${srcdir}/goxe" "${pkgdir}/usr/bin/goxe-bin"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
