# Maintainer: XandrCopyrighted <xxandrr@proton.me>

pkgname="discordrpc-v2"
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast Discord RPC Client written in Rust. - xxandr's fork"
arch=('any')
url="https://github.com/XandrCopyrighted/discordrpc"
license=('GPL3')

source=(
	"https://github.com/XandrCopyrighted/discordrpc/releases/download/v1/discordrpc.tar.xz"
	"https://raw.githubusercontent.com/XandrCopyrighted/discordrpc/main/LICENSE"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

depends=()
makedepends=()
provides=("discordrpc")
conflicts=("discordrpc")

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/discordrpc/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/discordrpc"
}
