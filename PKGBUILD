# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=urban-cli-bin
pkgver=0.0.1
pkgrel=2
pkgdesc='Blazingly fast command line interface for Urban Dictionary'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/urban-cli'
license=('GPL3')
depends=()
source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('84b1cfbd734001a85e2280d65aa7b5fa171bfd97ba475d19784eb9e7b961d2be')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('58569c103cace34c8fc8096c63e3b5371ca28a5b15927b2f474ba6307c5646b7')

package() {
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban-cli"
}
