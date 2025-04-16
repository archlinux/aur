# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.0.18
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
b2sums_x86_64=('7c33a5ea7d56fa8467a56a80d04c37da7f53b8b449ff5e10afacf55186a0875f5348898f707865fb2b248370fcfde028a24bd0f53ec0b1fd5927e18fcefdb251')
b2sums_aarch64=('6f13c35e7940880f62fff768f74272b8fa434a724ee90b4a96b07500824b46d2d89da5f5f162083fd54299a08a79902adc0d9da08c52fb458ecb066eb261414f')

package() {
	install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
