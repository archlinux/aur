# Maintainer: Maarten de Boer <info@maartendeboer.net>

pkgname=('qodana-cli')
pkgver=2024.3.1
pkgrel=1
pkgdesc="Simple cross-platform command-line tool to run Qodana linters anywhere with minimum effort required."
arch=('x86_64' 'aarch64')
url="https://github.com/JetBrains/qodana-cli"
license=('Apache-2.0')
depends=()

source_x86_64=("${pkgname}-${pkgver}.tar.zst::https://github.com/JetBrains/qodana-cli/releases/download/v${pkgver}/qodana_${pkgver}_linux_amd64.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}.tar.zst::https://github.com/JetBrains/qodana-cli/releases/download/v${pkgver}/qodana_${pkgver}_linux_arm64.pkg.tar.zst")

sha256sums_x86_64=('04a448134ed17a018c55258fd996fe51c8bd00a67a030145662c23998a65bdac')
sha256sums_aarch64=('04a448134ed17a018c55258fd996fe51c8bd00a67a030145662c23998a65bdac')

package() {
    cd "${srcdir}"
    install -Dm0755 usr/bin/qodana -t "${pkgdir}/usr/bin"
}
