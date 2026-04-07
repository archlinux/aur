# Maintainer: phlx0 <https://github.com/phlx0>
pkgname=drift-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal screensaver and idle visualizer with animated scenes"
arch=('x86_64' 'aarch64')
url="https://github.com/phlx0/drift"
license=('MIT')
provides=('drift')
conflicts=('drift' 'drift-git')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/phlx0/drift/releases/download/v${pkgver}/drift_linux_arm64.tar.gz")
sha256sums_x86_64=('64c4831d0032d1c8c57880d84e96d1e6eccd36d208f46287082a1e3f2cabe306')
sha256sums_aarch64=('e59cb9d6dc7c6a26a59dad82394f63744cd106e70a80b9602b79192aa6917207')

package() {
    install -Dm755 drift "${pkgdir}/usr/bin/drift"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
