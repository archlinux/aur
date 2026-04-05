# Maintainer: pparaxan <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple Arch Linux fetching tool that's not associated with X-Men."
arch=('x86_64')
url="https://codeberg.org/pparaxan/xfetch"
license=('MIT')
source=(
	"https://codeberg.org/pparaxan/xfetch/releases/download/v${pkgver}/xfetch-v${pkgver}.tar.xz"
	"https://codeberg.org/pparaxan/xFetch/raw/branch/master/LICENSE"
)
sha256sums=(
	'6d6c989d41ea2271d8efedd9abd77518a23ba684e10aaefd7c864438be0465bf'
	'fa3a95be608217d5aa1c563c6b71516353640b16c52905b82cd1794ff24565c0'
)

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"

	cd "$srcdir/xfetch"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
