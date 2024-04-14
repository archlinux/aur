# Maintainer: XDR <xxdr@duck.com>

pkgname="xfetch-bin"
pkgver=2.1.3
pkgrel=1
pkgdesc="A simple fetch written in Rust."
arch=('x86_64')
url="https://gitlab.com/XDRwastaken/xFetch"
license=('MIT')

source=(
	"https://gitlab.com/XDRwastaken/archived/-/raw/main/xFetch/xfetch_2.1.3.tar.gz"
	"https://gitlab.com/XDRwastaken/xFetch/-/raw/main/LICENSE"
)
sha256sums=(
	'ddcbc869a5570fbd1160140e9a44f6c81061d2c009910064a98ee94814ca144f'
	'SKIP'
)

conflicts=("xfetch")

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
