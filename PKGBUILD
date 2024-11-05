# Maintainer: xan <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=3.0.2
pkgrel=2
pkgdesc="Lightweight Linux fetch written in Rust."
arch=('x86_64')
url="https://codeberg.org/XDR/xFetch"
license=('MIT')

source=(
	"https://codeberg.org/xxan/xFetch/releases/download/v${pkgver}/xFetch-${pkgver}.tar.xz"
	"https://codeberg.org/xxan/xFetch/raw/branch/master/LICENSE"
)
sha256sums=(
	'541662961354c4d0bde69f045a7c44d1adad43bbe05dde7b9686189ed793f8ac'
	'SKIP'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
