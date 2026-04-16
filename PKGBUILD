# Maintainer: Qubernetic <info@qubernetic.com>
pkgname=copia-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI for Copia — source control for industrial automation"
arch=('x86_64' 'aarch64')
url="https://github.com/qubernetic/copia-cli"
license=('AGPL-3.0-only')
provides=('copia-cli')
conflicts=('copia-cli')

source_x86_64=("${url}/releases/download/v${pkgver}/copia-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/copia-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6ec094fc59dcf796e2574fd5144da08cd752ddc4363fc41bc889e6cd745eb8c0')
sha256sums_aarch64=('a485c6e320dc0b1e7e49bf58e9da3574f891975f43ad9b3ff31b9e558c6a4abb')

package() {
    install -Dm755 copia-cli "${pkgdir}/usr/bin/copia-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
