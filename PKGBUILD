# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.0.5
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
b2sums_x86_64=('e04a72ecb8f1aa235ee53e442e1b83f033e0b8a8ed936bcd73d7f2a735046b559ff6b922537d5a50d59d32843161b72eea3d46553c8f6a329bb1949a667cf7db')
b2sums_aarch64=('529531f0a09aa4c3e52b6a2627eae98f14702bbd707b3b89c5a1f95cb4851ac927090f9ea4e5bf8c4f41f49a7d8c2b6352ed2583f14744fb3f4750b3d22e01c1')

package() {
	install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
