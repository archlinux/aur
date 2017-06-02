pkgname=osx-arc-white
pkgver=1.4.3
pkgrel=1
pkgdesc="OSX-Arc-White Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
makedepends=('unzip')
source=("https://dl.opendesktop.org/api/files/download/id/1496170723/OSX-Arc-White-v1.4.3.tar.gz")
md5sums=('25331bc71b92994ddebba83c70e60870')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
