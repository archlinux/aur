# Maintainer: Tobias Os Finsbøl <tobias.finsbol@protonmail.com>
pkgname="web-search"
pkgver=1.0.2
pkgrel=1
pkgdesc="A way to search the web without needing to open browser first."
arch=('x86_64')
url="https://gitlab.com/TobbeBob123/web-search"
license=('GPL2' 'GPL3')
depends=('yad')
source=("https://gitlab.com/TobbeBob123/web-search/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('11e75c48ed0ae4b19aaa4f8d0826b198db4335225cbc01801d9b071bd34cf48d')

package() {
	install -Dm755 "$srcdir/${pkgname}-$pkgver/web-search" "$pkgdir/usr/bin/web-search"
	install -Dm644 "$srcdir/${pkgname}-$pkgver/web-search.desktop" "$pkgdir/usr/share/applications/web-search.desktop"
}
