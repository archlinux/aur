# Maintainer: XandrCopyrighted (or xxandr, XDR) <xxandrr@proton.me>

pkgname="xfetch-bin"
pkgver=3.6
pkgrel=1
pkgdesc="A simple fetch written in Rust."
arch=('any')
url="https://codeberg.org/XDR/xFetch"
license=('MIT')

source=(
	"https://codeberg.org/XDR/xFetch/releases/download/3.6/xfetch.tar.gz"
	"https://codeberg.org/XDR/xFetch/raw/branch/main/LICENSE"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

conflicts=("xfetch")

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
