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
sha512sums=('4763ed86f9f9a88b3de1c6a9e07fd82c51cd06bd7d2af1994896140eb83c054d')

package() {
	cd "$srcdir/arcticons-linux"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
