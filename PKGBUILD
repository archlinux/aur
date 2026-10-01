# Maintainer: kitters_kat
# Contributor: autinerd <autinerd-arch at kuyateh dot eu>

pkgname=arcticons-icon-theme
pkgver=15.3.2.0
pkgrel=1
pkgdesc='A monotone line-based icon pack for android - freedesktop version'
arch=('any')
url='https://codeberg.org/Arcticons/Arcticons-Linux'
license=('GPL3')
options=(!strip)
provides=('arcticons-icon-theme')
conflicts=('arcticons-icon-theme')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('b8f7e66f0270acad142e5cd05d4a6b146166314bd238f33ef463db5fd27fac981153c0c81886ed2eac82e95f69ee93251fd2b6a359dc99dd583ba6629643fb21')

package() {
	cd "$srcdir/arcticons-linux"
	install -d "$pkgdir/usr/share/icons"
	cp -r arcticons-light arcticons-dark "$pkgdir/usr/share/icons"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
