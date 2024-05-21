# Maintainer: Maarten de Boer <info@maartendeboer.net>

pkgname=('qodana-cli')
pkgver=2024.1.6
pkgrel=1
pkgdesc="Simple cross-platform command-line tool to run Qodana linters anywhere with minimum effort required."
arch=('x86_64' 'aarch64')
url="https://github.com/JetBrains/qodana-cli"
license=('Apache-2.0')
depends=()

source_x86_64=("${pkgname}-${pkgver}.tar.zst::https://github.com/JetBrains/qodana-cli/releases/download/v${pkgver}/qodana_${pkgver}_linux_amd64.pkg.tar.zst")
source_aarch64=("${pkgname}-${pkgver}.tar.zst::https://github.com/JetBrains/qodana-cli/releases/download/v${pkgver}/qodana_${pkgver}_linux_arm64.pkg.tar.zst")

sha256sums_x86_64=('98c01f8a1839c015e5d45f26abd1c5b6ff1db3ef1726512980a29dc683a4b45f')
sha256sums_aarch64=('98c01f8a1839c015e5d45f26abd1c5b6ff1db3ef1726512980a29dc683a4b45f')

package() {
	cd "${srcdir}"

	install -Dm0755 usr/bin/qodana -t "${pkgdir}/usr/bin"
}
