# Maintainer: xan <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc="Lightweight Linux fetch written in Rust."
arch=('x86_64')
url="https://codeberg.org/pparaxan/xFetch"
license=('MIT')

source=(
	"https://codeberg.org/pparaxan/xFetch/releases/download/v${pkgver}/xFetch-${pkgver}.tar.xz"
	"https://codeberg.org/pparaxan/xFetch/raw/branch/master/LICENSE"
)
sha256sums=(
	'43361110aee91c50c39e12b06af99b700be984b8e9fc7183ba1fa42c8d9c6984'
	'SKIP'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
