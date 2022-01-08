pkgname=manyverse-bin
pkgdesc="A social network off the grid"
pkgrel=0
pkgver=0.2201.7
arch=('x86_64')
url="https://manyver.se"
license=('MPL2')
source=(
	"https://github.com/staltz/manyverse/releases/download/v${pkgver}-beta/manyverse-${pkgver}-beta.tar.gz"
	'manyverse.desktop')
sha256sums=(
	'c960d8a15fdbe70f979ac6fd756a1ef6d3c781a443122455b5df3ce25ccd8c81'
	'f537094840e21bd9585760faa64d92f872774043aab8678fe4f02f6ff93f807e')

package() {
	mkdir -p "${pkgdir}/opt/"
	cp -r "manyverse-${pkgver}-beta/" "${pkgdir}/opt/manyverse"
	install -D -m755 "manyverse.desktop" "${pkgdir}/usr/share/applications/manyverse.desktop"
}
