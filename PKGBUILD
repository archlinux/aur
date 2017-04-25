pkgname=osx-arc-plus
pkgver=1.4.1
pkgrel=1
pkgdesc="OSX-Arc-Plus Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
makedepends=('unzip')
source=("https://dl.opendesktop.org/api/files/download/id/1492458841/OSX-Arc-Plus-v1.4.1.tar.gz")
md5sums=('3ed1e680962398327c83aae6408675fd')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
