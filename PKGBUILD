pkgname=osx-arc-shadow
pkgver=1.4.3
pkgrel=1
pkgdesc="OSX-Arc-Shadow Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1496170615/OSX-Arc-Shadow-v1.4.3.tar.gz")
md5sums=('33e40657e955e89568f4785b383677a2')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
