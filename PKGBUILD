# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="An open-source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/block/goose"
license=('Apache-2.0')
depends=()
makedepends=()
optdepends=(
	'bash: developer and computer controller extensions'
	'ruby: computer controller extension'
	'ripgrep: searching in developer extension'
	'ollama: locally-running models'
	'org.freedesktop.secrets: API key management'
	'xdg-desktop-portal: screenshot capabilities on Wayland'
	'libxcb: window and screenshot capabilities on X'
	'xdotool: computer controller extension on X'
	'wmctrl: computer controller extension on X'
	'xclip: computer controller extension on X'
	'xorg-xwininfo: computer controller extension on X'
	'wtype: computer controller extension on Wayland'
	'wl-clipboard: computer controller extension on Wayland'
)
provides=('codename-goose')
conflicts=('codename-goose')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.bz2::https://github.com/block/goose/releases/download/v${pkgver}/goose-x86_64-unknown-linux-gnu.tar.bz2")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.bz2::https://github.com/block/goose/releases/download/v${pkgver}/goose-aarch64-unknown-linux-gnu.tar.bz2")
b2sums_x86_64=('3c82e80fab3b93bff4ee570e3ef965168ee129e8f27c5a2aa54ef3915af48d7c1ca4be7608871e85dd8a0ef735d36afc680949ffccb227a409d81dea49cd8c14')
b2sums_aarch64=('e377b6995d42c4690863ecd051618556b1489d4730f21ba5c13330ec7dcf10e6940c652f2121ed8df3fdac1ad299adf4f9eccfa9afba2c3273cc25a6251dc85a')

package() {
	install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
