pkgname=osx-arc-white
pkgver=1.0
pkgrel=1
pkgdesc="OSX-Arc-White Theme for GTK 3.x"
arch=(any)
url=http://gnome-look.org/content/show.php/OSX-Arc-White?content=175666
depends=('gtk3')
makedepends=('unzip')
source=("http://gnome-look.org/CONTENT/content-files/175666-OSX-Arc-White.zip")
md5sums=('4b83bbd8d1b7302af80feedbcd9f28a4')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
