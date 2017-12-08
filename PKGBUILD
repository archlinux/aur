pkgname=osx-arc-white
pkgver=1.4.5
pkgrel=2
pkgdesc="OSX-Arc-White Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
makedepends=('unzip')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1511459102/s/478c7995e96c3694c30aa8db98fe43a5/t/1512760162/OSX-Arc-White-v1.4.5.zip")
md5sums=('c4395f4f37c92ab81142e8cf8d307fde')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
