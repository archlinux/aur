# Maintainer: XDR <xxdr@duck.com>

pkgname="xfetch-bin"
pkgver=2.1.2
pkgrel=1
pkgdesc="A simple fetch written in Rust."
arch=('any')
url="https://gitlab.com/XDRwastaken/xFetch"
license=('MIT')

source=(
	"https://gitlab.com/XDRwastaken/archived/-/raw/main/xFetch/xfetch_2.1.2.tar.gz"
	"https://gitlab.com/XDRwastaken/xFetch/-/raw/main/LICENSE?ref_type=heads"
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
