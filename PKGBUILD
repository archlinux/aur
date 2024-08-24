# Maintainer: XDR <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=2.3.1
pkgrel=2
pkgdesc="A simple fetch written in Rust."
arch=('x86_64')
url="https://github.com/XDRwastaken/xFetch"
license=('MIT')

source=(
	"https://github.com/XDRwastaken/xFetch/releases/download/${pkgver}/xfetch_${pkgver}.tar.xz"
	"https://raw.githubusercontent.com/XDRwastaken/xFetch/main/LICENSE"
)
sha256sums=(
	'4ca47aa8e0fd380262de49f31e05b28dccb5ec93e9c3dcd17ab163a546ca36d7'
	'SKIP'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
