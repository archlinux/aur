# Maintainer: XandrCopyrighted <xxandrr@proton.me>

pkgname="xfetch-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="The world's simplest fetch written in Rust."
arch=('any')
url="https://github.com/XandrCopyrighted/xFetch/"
license=('MIT')

source=(
	"https://github.com/XandrCopyrighted/xFetch/releases/download/2.0.0/xfetch.tar.gz"
	"https://github.com/XandrCopyrighted/xFetch/blob/main/LICENSE"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

depends=()
makedepends=()
provides=("xfetch")
conflicts=('xfetch-rs-git' 'xfetch')

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
