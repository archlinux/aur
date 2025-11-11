# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.13.2
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
b2sums_x86_64=('d17b6326f8850ea6109166584490d628f2d2adeb1abcf8292d35ee49c07fa9618bbb099924234ba0da0367aceaa1551580583b116f630e9e60f9ee016ef9c727')
b2sums_aarch64=('48cc6faf0111eb7f2c5e50251bcbf41abb017946c32d126489b69f960b5f08a632c8f04684fdb5b67888a893299dd9ec69c8e5afd6bab92f8d28f2074d4a2e3f')

package() {
	install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
