# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe
pkgver=1.1.0
pkgrel=1
pkgdesc="Goxe is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' "aarch64")
url="https://github.com/DumbNoxx/Goxe"
license=('Apache')
source_x86_64=("https://github.com/DumbNoxx/Goxe/releases/download/v${pkgver}/Goxe_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/DumbNoxx/Goxe/releases/download/v${pkgver}/Goxe_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c9d4f5250dd6ad5648f253af4ce4c28a6de2319d749128466af8de8b01c99ee5')
sha256sums_aarch64=('10a8df2a3f975dbefa76274501db3eb031032a282dabd9c4241a8f3e2b36462e')

package() {
  install -Dm755 "${srcdir}/Goxe" "${pkgdir}/usr/bin/goxe"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || true
}
