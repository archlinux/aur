# Maintainer: phlx0 <https://github.com/phlx0>
pkgname=drift-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal screensaver and idle visualizer with animated scenes"
arch=('x86_64' 'aarch64')
url="https://github.com/phlx0/drift"
license=('MIT')
provides=('drift')
conflicts=('drift' 'drift-git')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_arm64.tar.gz")
sha256sums_x86_64=('756e7bf9c39bc95aed98c9d2ffb07d251ef8ca7932f2733378c29ba93c9242a4')
sha256sums_aarch64=('4449f0e26d4935894d38ab0d5e736eabc410890c941a80874ae79cc4019d2cda')

package() {
    install -Dm755 drift "${pkgdir}/usr/bin/drift"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
