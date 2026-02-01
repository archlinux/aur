# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe
pkgver=1.1.1
pkgrel=1
pkgdesc="Goxe is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' "aarch64")
url="https://github.com/DumbNoxx/Goxe"
license=('Apache')
source_x86_64=("https://github.com/DumbNoxx/Goxe/releases/download/v${pkgver}/Goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/Goxe/releases/download/v${pkgver}/Goxe_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6da62b2e292252d3c5a76d965546a36be0bf1824776353201c9c7731cca3e7c0')
sha256sums_aarch64=('aaf6a1f415156b0bbe4edc8582a87821f85a4a17a0347a6587b25864d2504b3f')

package() {
  install -Dm755 "${srcdir}/Goxe" "${pkgdir}/usr/bin/goxe"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
}
