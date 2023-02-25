# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=deeplx-bin
pkgver=0.7.2
pkgrel=2
pkgdesc="Permanently free DeepL API written in Golang"
arch=('x86_64' 'i686' 'aarch64' 'mips')
url="https://github.com/OwO-Network/DeepLX"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('deeplx')
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
source=('https://raw.githubusercontent.com/OwO-Network/DeepLX/main/deeplx.service')
source_x86_64=("deeplx-x86_64::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_amd64")
source_aarch64=("deeplx-aarch64::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_arm64")
source_i686=("deeplx-i686::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_386")
source_mips=("deeplx-mips::https://github.com/OwO-Network/DeepLX/releases/download/v$pkgver/deeplx_linux_mips")
noextract=()
sha256sums=('4254690f52328eeb9f4c7a83485947ca024d66d6358b1cc3bf9554c8d870d434')
sha256sums_x86_64=('e84b83446e55ef1ddd69016a8bc7b9b69fd684ff372c71511c61f6f64d7fd9e4')
sha256sums_i686=('6a00cd9716cb21ea5b5ed4a89490b665c58f22877f1b471a978ea8edae1abce1')
sha256sums_aarch64=('51f32e27a1a0555f817429fbae45f691e160342cd78c224e34fc9503d10e38cf')
sha256sums_mips=('9a7ac72220498db0a5c41b8a16d5c3492e98567225ccc178531f78cf5c28a294')
validpgpkeys=()


package() {
		install -Dm755 "deeplx-${CARCH}" ${pkgdir}/usr/bin/deeplx
		install -Dm644 deeplx.service -t ${pkgdir}/etc/systemd/system/
}
