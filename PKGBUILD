# Maintainer: XDR <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=3.0.1
pkgrel=1
pkgdesc="Lightweight Linux fetch written in Rust."
arch=('x86_64')
url="https://codeberg.org/XDR/xFetch"
license=('MIT')

source=(
	"https://codeberg.org/XDR/xFetch/releases/download/v${pkgver}/xFetch-${pkgver}.tar.xz"
	"https://codeberg.org/XDR/xFetch/raw/branch/master/LICENSE"
)
sha256sums=(
	'699377dac68dc3c1c43a22e7261c00a2e10f0b0e8a01d4c768ba24ba2aadeacb'
	'SKIP'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
