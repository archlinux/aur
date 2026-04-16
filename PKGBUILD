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
sha256sums_x86_64=('e27c45097bb88ee18424bd0f725f5678677436c241ecace9b95c359aaeb35028')
sha256sums_aarch64=('ec970ca97736931d7efd780a9ebd120caaca8b0f45ec9cb4e6d74514ec4507e2')

package() {
    install -Dm755 copia-cli "${pkgdir}/usr/bin/copia-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
