# Maintainer: XandrCopyrighted (or xxandr, XDR) <xxandrr@proton.me>

pkgname="xfetch-bin"
pkgver=3.3
pkgrel=1
pkgdesc="A simple fetch written in Rust."
arch=('any')
url="https://github.com/XandrCopyrighted/xFetch/"
license=('MIT')

source=(
	"https://github.com/XandrCopyrighted/xFetch/releases/download/3.3/xfetch.tar.gz"
	"https://raw.githubusercontent.com/XandrCopyrighted/xFetch/main/LICENSE"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

depends=("coreutils")
makedepends=()
conflicts=("xfetch")

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
