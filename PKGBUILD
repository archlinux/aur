# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname="web-search"
pkgver=1.0.1
pkgrel=1
pkgdesc="A way to search the web without needing to open browser first."
arch=('x86_64')
url="https://gitlab.com/TobbeBob123/web-search"
license=('GPL2' 'GPL3')
depends=('yad')
source=("https://gitlab.com/TobbeBob123/web-search/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fd38ed4abcbcac8abda76cc0f2b94e9c4a926c1c8362842f18ce713fd0b6e2df')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/web-search" "$pkgdir/usr/bin/web-search"
	install -Dm644 "$srcdir/${pkgname}-$pkgver/web-search.desktop" "$pkgdir/usr/share/applications/web-search.desktop"
}
