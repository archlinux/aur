# Maintainer: XDR <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple fetch written in Rust."
arch=('x86_64')
url="https://github.com/XDRwastaken/xFetch"
license=('MIT')

source=(
	"https://github.com/XDRwastaken/xFetch/releases/download/${pkgver}/xfetch_${pkgver}.tar.xz"
	"https://raw.githubusercontent.com/XDRwastaken/xFetch/main/LICENSE"
)
sha256sums=(
	'ddcbc869a5570fbd1160140e9a44f6c81061d2c009910064a98ee94814ca144f'
	'SKIP'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
