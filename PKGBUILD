pkgname=osx-arc-shadow
pkgver=1.1
pkgrel=1
pkgdesc="OSX-Arc-Shadow Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1013481/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1470834310/OSX-Arc-Shadow.tar.gz")
md5sums=('054ea68d52562f137effc3153af370f4')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
