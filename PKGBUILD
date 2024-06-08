# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=urban-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Blazingly fast command line interface for Urban Dictionary'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/urban-cli'
license=('GPL3')
depends=()
source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('62cc96b590687c7931ac6cd9153842c6734cbf94262c15f1c77f9d5e28a79647')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('9bc448ec7013b7254148af74ed07a55dc9a142588489151af927a65c2b39356e')

package() {
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban-cli"
}
