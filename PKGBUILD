# Maintainer: XDR <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=3.0.0
pkgrel=1
pkgdesc="Lightweight Linux fetch written in Rust."
arch=('x86_64')
url="https://codeberg.org/XDR/xFetch"
license=('MIT')

source=(
	"https://codeberg.org/XDR/xFetch/releases/download/${pkgver}/xFetch-${pkgver}.tar.xz"
	"https://codeberg.org/XDR/xFetch/raw/branch/master/LICENSE"
)
sha256sums=(
	'4215cfa97b2cc261c1bc68b976285d0b0ee2ec4642206454bd9d4238cb2e2406'
	'SKIP'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
