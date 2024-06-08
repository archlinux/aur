# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=urban-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Blazingly fast command line interface for Urban Dictionary'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/urban-cli'
license=('GPL3')
depends=()
source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('eece0dd3b33a3f42122dd0e59d41c29f009807fa388b1a004977d324017b178a')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('e5710cf23017ca6994db6334f687f4e38732e218039f81b2689feb1a634c0b97')

package() {
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban-cli"
}
