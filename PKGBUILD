# Maintainer: WilliamAnimate <nyameowmeow@duck.com>

pkgname="exfetch-bin"
pkgver=0.11.0
pkgrel=1
pkgdesc="A fork of xFetch designed to look as good as possible, whilst maintaining its high performance."
arch=('x86_64')
url="https://github.com/WilliamAnimate/exfetch"
license=('MIT')

source=(
	"https://github.com/WilliamAnimate/exfetch/releases/download/v0.11.0/exfetch.gz"
	"https://raw.githubusercontent.com/WilliamAnimate/exfetch/main/LICENSE"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/exfetch/LICENSE"
	install -Dm755 exfetch "${pkgdir}/usr/bin/exfetch"
}
