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
sha256sums_x86_64=('7316034473833e9c519cd97dbdea029d6b70a96a2db52c163f7524d32b3f997a')
sha256sums_aarch64=('659d4963e8560f4acc3f1d2221082e28eaf8c94fd2e28d7792aa1ad6e97b07dc')

package() {
    install -Dm755 copia-cli "${pkgdir}/usr/bin/copia-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
