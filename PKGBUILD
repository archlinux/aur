# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe
pkgver=1.0.1
pkgrel=1
pkgdesc="Goxe is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' "aarch64")
url="https://github.com/DumbNoxx/Goxe"
license=('Apache')
source_x86_64=("https://github.com/DumbNoxx/Goxe/releases/download/v${pkgver}/Goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/Goxe/releases/download/v${pkgver}/Goxe_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7c42058dad50e15eb67063de7aa031110910d99e6d9dc7e00140bcf08646a9eb')
sha256sums_aarch64=('360dc591c96eb42b2127b78c0664fa500e03d711ba74ac13427fc50cc6cdcc27')

package() {
  install -Dm755 "${srcdir}/Goxe" "${pkgdir}/usr/bin/goxe"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
}
