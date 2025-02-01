# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.0.4
pkgrel=5
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
b2sums_x86_64=('d828c17db68fbe043101eade80113d457e370d8b69c81599a35ac056850dc08a27c751a1333fb07c89ecd2c10da7e788ea2ea0e0f8b242fb9d72f8b984a4e89a')
b2sums_aarch64=('987cdd3a3bd146da651520ed4cb505a8fa903b49bee315c2f926f387bbd6c45c477ebf05a4a3275357de2615b20e49ff3283fb37951e807ede08d421c1f076a8')

package() {
	install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
