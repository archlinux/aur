# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=localstack-cli-bin
pkgver=2026.8.2
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
sha256sums_x86_64=('6067f6140c9ef6d7010be7ede6308dea9f288fc1bb82be1aa76927faf0603863')
sha256sums_aarch64=('1ea90128c95035f13d286061a20c04b821640fffca309ca038038e70e69520a0')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/localstack" "${pkgdir}/usr/bin/localstack"
}
