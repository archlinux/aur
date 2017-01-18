pkgname=osx-arc-shadow
pkgver=1.3.7
pkgrel=1
pkgdesc="OSX-Arc-Shadow Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1483938853/OSX-Arc-Shadow-v1.3.7.tar.gz")
md5sums=('06562f145ce0b524db5cd6fbc70d13a0')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
