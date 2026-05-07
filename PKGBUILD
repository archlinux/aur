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
sha512sums=('03d7ddd59a694290a37fc68a08ea6b77813d424865bb3ece4ee926781400f93206ac2e09fdf443dbf7737ace78518bff01140d9e6e86ba3c84fca3c35239803e')

package() {
	cd "$srcdir/arcticons-linux"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
