# Maintainer: phlx0 <https://github.com/phlx0>
pkgname=drift-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal screensaver and idle visualizer with animated scenes"
arch=('x86_64' 'aarch64')
url="https://github.com/phlx0/drift"
license=('MIT')
provides=('drift')
conflicts=('drift' 'drift-git')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_arm64.tar.gz")
sha256sums_x86_64=('0315e1230f0a8cd1679b33a135a25ad537b08462a1e1c62d01388e90ac68b8b9')
sha256sums_aarch64=('64d73c6be06ddf639b61072e6b793c133f0c1c6088f4569f0d2ca8162d5f452b')

package() {
    install -Dm755 drift "${pkgdir}/usr/bin/drift"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
