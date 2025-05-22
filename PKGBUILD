# Maintainer: pparaxan <xxdr@duck.com>
pkgname="xfetch-bin"
pkgver=5.0.0
pkgrel=1
pkgdesc="not associated with xmen; that one fetching tool made in zig."
arch=('x86_64')
url="https://codeberg.org/pparaxan/xFetch"
license=('MIT')

source=(
	"https://codeberg.org/pparaxan/xFetch/releases/download/v${pkgver}/xFetch-${pkgver}.tar.xz"
	"https://codeberg.org/pparaxan/xFetch/raw/branch/master/LICENSE"
)
sha256sums=(
	'b21ca1d388d5d385b6b73a07d063f2136fcad97b05b4f57dbf266956284db675'
	'831e0b2afed192484f6f7bfa09833299c945057b681b639fb0b3f2fd07c86460'
)

package() {
	cd "$srcdir/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xfetch/LICENSE"
	install -Dm755 xfetch "${pkgdir}/usr/bin/xfetch"
}
