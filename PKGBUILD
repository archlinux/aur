# Maintainer: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=8.0.6.1
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
sha512sums=('58dc677a8b8eb298191445c94c0bc452b16ebc96bdbb120664d8563294ca09f008079cedbad7c6d813abd4ad14b77b2e164eb5aad1f120ce8622dd87c8ec81db')

package() {
	cd "$srcdir/Arcticons-Linux-$pkgver"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
