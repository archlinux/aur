pkgname=osx-arc-shadow
pkgver=1.0
pkgrel=1
pkgdesc="OSX-Arc-Shadow Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1013481/
depends=('gtk3')
makedepends=('unzip')
source=("https://dl.opendesktop.org/api/files/download/id/1464732043/175679-OSX-Arc-Shadow.zip")
md5sums=('f7e3c41c3014940ca194bcffdb61693d')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
