# Maintainer: Maarten de Boer <info@maartendeboer.net>

pkgname=('qodana-cli')
pkgver=2024.2.6
pkgrel=1
pkgdesc="Simple cross-platform command-line tool to run Qodana linters anywhere with minimum effort required."
arch=('x86_64' 'aarch64')
url="https://github.com/JetBrains/qodana-cli"
license=('Apache-2.0')
depends=()

source_x86_64=("${pkgname}-${pkgver}.tar.zst::https://github.com/JetBrains/qodana-cli/releases/download/v${pkgver}/qodana_${pkgver}_linux_amd64.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}.tar.zst::https://github.com/JetBrains/qodana-cli/releases/download/v${pkgver}/qodana_${pkgver}_linux_arm64.pkg.tar.zst")

sha256sums_x86_64=('48fd9566f3650c8b82b57320820ecc8a339741292ce0d9f825f1c3423a8b0251')
sha256sums_aarch64=('48fd9566f3650c8b82b57320820ecc8a339741292ce0d9f825f1c3423a8b0251')

package() {
    cd "${srcdir}"
    install -Dm0755 usr/bin/qodana -t "${pkgdir}/usr/bin"
}
