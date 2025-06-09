# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.0.26
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
b2sums_x86_64=('fc94cb01081cfef29fdf695866078a2a2c0fba51d745d35b7d2c5654e645054a09f4b98633de39162a04586b26778760d91a066c71e80de3b2dff7642effbfe1')
b2sums_aarch64=('e552b9f3edc26a7b27909d8a99553810794038c43c6010505929c76f61eab0644aac4cdd5af6e9669f8d6298de5b8c0593769f2a6bfd9d98a615792ed70a7b71')

package() {
	install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
