# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.0.6
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
)
provides=('codename-goose')
conflicts=('codename-goose')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.bz2::https://github.com/block/goose/releases/download/v${pkgver}/goose-x86_64-unknown-linux-gnu.tar.bz2")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.bz2::https://github.com/block/goose/releases/download/v${pkgver}/goose-aarch64-unknown-linux-gnu.tar.bz2")
b2sums_x86_64=('7bde900357cdc91fab4e6a7278c083bf7c8d72c46914f29226423ffac054929f41e4cee5cf95171f18cd0ef179a01b40f0b32fc82d51e3c769e1e2e5cb232f26')
b2sums_aarch64=('472cb784e61f2deafa71d4f19ece7932bab3162d636fbe7e9a0c697610c3dd8a765e43d25fc5ae8a9460e1b6c73c360df697ab49776c603362e2e80ca61f03c9')

package() {
	install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
