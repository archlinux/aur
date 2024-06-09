# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>

pkgname=urban-cli-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Blazingly fast command line interface for Urban Dictionary'
arch=('x86_64' 'aarch64')
url='https://github.com/tfkhdyt/urban-cli'
license=('GPL3')
depends=()
source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('42b57d157f1981c247edcc5b238678a701a87940f32a5e7991d36b236121a0fb')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/urban-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('67952ee2c16c97e70350cf1943f44d9c156347dacaba935d6d94bd311ec20543')

package() {
	install -Dm755 urban-cli "${pkgdir}/usr/bin/urban-cli"
}
