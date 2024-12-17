# Maintainer: Benjamin Chausse <benjamin@chausse.xyz>
pkgname='termpicker'
pkgver=1.3.6
pkgrel=2
pkgdesc="A color picker for the terminal"
arch=('x86_64')
url="https://github.com/ChausseBenjamin/termpicker"
license=('Beerware')
groups=()
depends=()
makedepends=()

optdepends=(
  'wl-clipboard: clipboard support on wayland'
  'xsel: clipboard support on X11'
)

provides=('termpicker')
source=(
  "$pkgname-v$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname}_Linux_x86_64.tar.gz"
)


sha256sums=('231fbe1480afff1f8af966caba39d7783144ef6c7381ddaad67960996e1040ef')


package() {
	install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
