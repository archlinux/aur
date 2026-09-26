# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=localstack-cli-bin
pkgver=2026.8.0
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
sha256sums_x86_64=('59304bb5901f6240cdb3e94c9e616bebbcda28ead01436536f356ba8d4ce7676')
sha256sums_aarch64=('f71b901b1ce2f1567d691059ee585a50c76412820394c96f3d8bcc315a5ba2f5')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/localstack" "${pkgdir}/usr/bin/localstack"
}
