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
sha256sums_x86_64=('5e3e947c59617c7d6fa6cb0c00755c80a6fb3f3a99f2eebee44e398f8f80f97d')
sha256sums_aarch64=('83a027d89e39c4e8c80e99695b0a17fac4227666242725f49a341c6f464ad986')

package() {
    install -Dm755 copia-cli "${pkgdir}/usr/bin/copia-cli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
