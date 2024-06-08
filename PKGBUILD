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
sha256sums_x86_64=('6f347ab089119b7f149dd4cddb1b7504ae0f382db6a7269fd31d9348cb08af50')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('e585efa4245bbe755a060077a9301dd4b149d4e40d1423434eecc880a1fa94f8')

package() {
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban-cli"
}
