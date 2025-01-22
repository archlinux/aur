# Maintainer: xan <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=4.0.0
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
	'50ceb70d7657565565be41364132bbf652a2e0895cd5893d3950dae9ea1a7b92'
	'SKIP'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
