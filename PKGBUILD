# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=localstack-cli-bin
pkgver=4.10.0
pkgrel=1
pkgdesc="LocalStack CLI - Command-line interface for LocalStack"
arch=('x86_64' 'aarch64')
url="https://github.com/localstack/localstack-cli"
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=('localstack-cli')
conflicts=('localstack-cli')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/localstack/localstack-cli/releases/download/v${pkgver}/localstack-cli-${pkgver}-linux-amd64-onefile.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/localstack/localstack-cli/releases/download/v${pkgver}/localstack-cli-${pkgver}-linux-arm64-onefile.tar.gz")
sha256sums_x86_64=('9ab86df86cb22bfe6dc45028e60763fc72669f7922abd3542b46ebc29653ef18')
sha256sums_aarch64=('97c56885e10e25bb5b5c3c8a727f21c1582232e9ce3b30fb63e08e5830d16c55')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/localstack" "${pkgdir}/usr/bin/localstack"
}
