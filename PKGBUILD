# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=localstack-cli-bin
pkgver=2026.5.0
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
sha256sums_x86_64=('8f9b8b452b1ba0ce5efb581c07f5101db5af119484b49cd091c49d3000517913')
sha256sums_aarch64=('55e2c13cca96fda504a316b66c5802d86f41d130bf2d59a79c184adcb54ec7f8')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/localstack" "${pkgdir}/usr/bin/localstack"
}
