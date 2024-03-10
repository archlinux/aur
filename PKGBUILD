# Maintainer: XandrCopyrighted (or xxandr, XDR) <xxandrr@proton.me>

pkgname="exfetch-bin"
pkgver=0.9.0
pkgrel=1
pkgdesc="A fork of xFetch designed to look as good as possible, whilst maintaining its high performance."
arch=('any')
url="https://github.com/WilliamAnimate/exfetch"
license=('MIT')

source=(
	"https://github.com/WilliamAnimate/exfetch/releases/download/v0.9.0/exfetch.tar.gz"
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
