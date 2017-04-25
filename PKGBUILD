pkgname=osx-arc-shadow
pkgver=1.4.1
pkgrel=1
pkgdesc="OSX-Arc-Shadow Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1492457989/OSX-Arc-Shadow-v1.4.1.tar.gz")
md5sums=('1503c5195670b1ae99cb4980626fb507')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
