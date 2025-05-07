# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.0.22
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
b2sums_x86_64=('588904f072231e81e0cdc1b4125422bff3b62054a2d50017fd6a3993d8dda3e872fc6cc097950d7f80429ec710d6da48eb3bada88cac5e170a70f4b8cd5dc13b')
b2sums_aarch64=('c84aa101a6777b4aefa47ae8a43ff477b998ae568b59fab4140f0b67dbfdb5240bb8dd37a006a17ec21705ed9209dd74d8dca16d11ed696000708b51f66703d3')

package() {
	install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
