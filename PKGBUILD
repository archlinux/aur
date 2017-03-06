pkgname=osx-arc-shadow
pkgver=1.3.9
pkgrel=1
pkgdesc="OSX-Arc-Shadow Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1488643168/OSX-Arc-Shadow-v1.3.9.tar.gz")
md5sums=('acab27ac109c049ec5545f62277753b3')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
