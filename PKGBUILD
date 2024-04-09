# Maintainer: XDR <xxdr@duck.com>

pkgname="discordrpc-v2"
pkgver=0.2.6
pkgrel=1
pkgdesc="Fast Discord RPC Client written in Rust. - XDR's fork"
arch=('any')
url="https://gitlab.com/XDRwastaken/DiscordRPC"
license=('GPL3')

source=(
	"https://gitlab.com/XDRwastaken/archived/-/raw/main/DiscordRPC/discordrpc_0.2.6.tar.xz"
	"https://gitlab.com/XDRwastaken/DiscordRPC/-/raw/main/LICENSE"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

conflicts=("discordrpc")

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/discordrpc/LICENSE"
	install -Dm755 discordrpc "${pkgdir}/usr/bin/discordrpc"
}
