# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=8.0.6.2
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version'
arch=('any')
optdepends=('inkscape: for generationg the symbolic icons')
url='https://github.com/Donnnno/Arcticons-Linux'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('404642ea83cf80fc7765932a17c42d8c7dc659d6b390e6d01512da8412055197bf095a89e4af99c9d8a2272caf20b8c027813d298433b1537146fc2090da4997')

package() {
	cd "$srcdir/Arcticons-Linux-$pkgver"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
