# Maintainer: XandrCopyrighted <xxandrr@proton.me>

pkgname="discordrpc-v2"
pkgver=2.0
pkgrel=1
pkgdesc="Fast Discord RPC Client written in Rust. - XDR's fork"
arch=('any')
url="https://codeberg.org/XDR/DiscordRPC"
license=('GPL3')

source=(
	"https://codeberg.org/XDR/DiscordRPC/releases/download/v2/discordrpc.tar.xz"
	"https://codeberg.org/XDR/DiscordRPC/raw/branch/main/LICENSE"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

provides=("discordrpc")
conflicts=("discordrpc")

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/discordrpc/LICENSE"
	install -Dm755 discordrpc "${pkgdir}/usr/bin/discordrpc"
}
