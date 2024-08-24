# Maintainer: XDR <xxdr@duck.com>
pkgname="discordrpc-v2"
pkgver=0.2.6
pkgrel=2
pkgdesc="Fast Discord RPC Client written in Rust, XDR's fork."
arch=('x86_64')
url="https://github.com/XDRwastaken/DiscordRPC"
license=('GPL3')

source=(
	"https://github.com/XDRwastaken/DiscordRPC/releases/download/${pkgver}/discordrpc_${pkgver}.tar.xz"
	"https://raw.githubusercontent.com/XDRwastaken/DiscordRPC/main/LICENSE"
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
