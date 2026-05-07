# Maintainer: kitters_kat
# Contributor: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=14.7.1.0
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version'
arch=('any')
url='https://codeberg.org/Arcticons/Arcticons-Linux'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('713f36bd091565b088d615c1c90edac5a850e6a98294d60208d36eb90713127784e35c9dbe0767bdeaa1e593aaba70c6bf2d13086cdb55ed18824f9b54fa9ffe')

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
