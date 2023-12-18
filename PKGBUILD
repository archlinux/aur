# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=8.2.0.0
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
sha512sums=('bc7d1071ef95e17e87cb9230de637d15c98810aca5daf0b080a6acc05929a0ac57a02c55852f79c5d15e9c9ee20e7541c6bc7f1aef119178aef04edbb9910af0')

package() {
	cd "$srcdir/Arcticons-Linux-$pkgver"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
