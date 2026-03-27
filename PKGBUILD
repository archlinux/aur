# Maintainer: phlx0 <https://github.com/phlx0>
pkgname=drift-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Terminal screensaver and idle visualizer with animated scenes"
arch=('x86_64' 'aarch64')
url="https://github.com/phlx0/drift"
license=('MIT')
provides=('drift')
conflicts=('drift' 'drift-git')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_arm64.tar.gz")
sha256sums_x86_64=('7621d7ca37598d51a41b6725c3f5fa4f72981f93a7f521d03a770003f75c0eb4')
sha256sums_aarch64=('1bf3c620e66e2bd3ac1575e9c2a77e5af2924194cdba1de6cc70c8f64b0716ed')

package() {
    install -Dm755 drift "${pkgdir}/usr/bin/drift"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
