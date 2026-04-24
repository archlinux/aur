# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=localstack-cli-bin
pkgver=2026.3.0
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
sha256sums_x86_64=('c23521f9e8878036db29e7667ab497b98397e544f87e179e517c0926655147db')
sha256sums_aarch64=('deca87bef909de70ac02ec6ab065359a5eb0d883b3337432fc953d51297a6153')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/localstack" "${pkgdir}/usr/bin/localstack"
}
