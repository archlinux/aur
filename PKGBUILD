pkgname=manyverse-bin
pkgdesc="A social network off the grid"
pkgrel=0
pkgver=0.2201.5
arch=('x86_64')
url="https://manyver.se"
license=('MPL2')
source=(
	"https://github.com/staltz/manyverse/releases/download/v${pkgver}-beta/manyverse-${pkgver}-beta.tar.gz"
	'manyverse.desktop')
sha256sums=(
	'5eaf398a1412149f01c93c3a03c380f89d094cc50c2addd9a2352819969e49d1'
	'f537094840e21bd9585760faa64d92f872774043aab8678fe4f02f6ff93f807e')

package() {
	mkdir -p "${pkgdir}/opt/"
	cp -r "manyverse-${pkgver}-beta/" "${pkgdir}/opt/manyverse"
	install -D -m755 "manyverse.desktop" "${pkgdir}/usr/share/applications/manyverse.desktop"
}
