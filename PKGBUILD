# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=urban-cli-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='Blazingly fast command line interface for Urban Dictionary'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/urban-cli'
license=('GPL3')
depends=()
source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('2b43c5636f9d61862a0f02d41c34f0288cf574c03ee990222cfbb06768360e93')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('0c437da113a34a39b432c50469c101e4ab8c02ffc27c25637a6e4580711c0f35')

package() {
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban-cli"
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban"
}
