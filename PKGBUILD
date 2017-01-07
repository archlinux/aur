pkgname=osx-arc-darker
pkgver=1.3.5
pkgrel=1
pkgdesc="OSX-Arc-Darker Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1483577492/OSX-Arc-Darker-v1.3.5.tar.gz")
md5sums=('46219b27af8058ebad4b48638eb76b12')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
