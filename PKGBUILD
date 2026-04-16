# Maintainer: Qubernetic <info@qubernetic.com>
pkgname=copia-cli-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="CLI for Copia — source control for industrial automation"
arch=('x86_64' 'aarch64')
url="https://github.com/qubernetic/copia-cli"
license=('AGPL-3.0-only')
provides=('copia-cli')
conflicts=('copia-cli')

source_x86_64=("${url}/releases/download/v${pkgver}/copia-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/copia-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('36c94736a11b8190e640089788138d3fcd6fdf2c896b46a92a7b4c41cbe14868')
sha256sums_aarch64=('194c62144bbaa3bcfcfd78cd73ec4d378cbf64e4e499b9cae142e200bd517d61')

package() {
    install -Dm755 copia-cli "${pkgdir}/usr/bin/copia-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
