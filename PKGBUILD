# Maintainer: Benjamin Chausse <benjamin@chausse.xyz>
pkgname='termpicker'
pkgver=1.3.5
pkgrel=1
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


sha256sums=('accd5ea9b06f012fefa6f0be49ceee7f4d26ed1da6a20447916e4e715beb37f6')


package() {
	install -Dm755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
