# Maintainer: phlx0 <https://github.com/phlx0>
pkgname=drift-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Terminal screensaver and idle visualizer with animated scenes"
arch=('x86_64' 'aarch64')
url="https://github.com/phlx0/drift"
license=('MIT')
provides=('drift')
conflicts=('drift' 'drift-git')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_arm64.tar.gz")
sha256sums_x86_64=('8234caa372f0af3c217ecf862f49fef2a562dcf4cf20e4d97ef996d36a561aed')
sha256sums_aarch64=('08e24003abadb6e0c0474863d064004bef728df484f294bf61cd05c67d578123')

package() {
    install -Dm755 drift "${pkgdir}/usr/bin/drift"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
