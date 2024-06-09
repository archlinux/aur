# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=urban-cli-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Blazingly fast command line interface for Urban Dictionary'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/urban-cli'
license=('GPL3')
depends=()
source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('972b4af6c127e479c1fde0c0e07dd567ee9504e809c483f1230110082e0166b8')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('568aed25a5a21aad8012411ae6b607fcdbd07274d91c65ddfabeaeed9176949d')

package() {
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban-cli"
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban"
}
