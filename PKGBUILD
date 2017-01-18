pkgname=osx-arc-darker
pkgver=1.3.7
pkgrel=1
pkgdesc="OSX-Arc-Darker Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1483938925/OSX-Arc-Darker-v1.3.7.tar.gz")
md5sums=('eb3db93e6f321c4ac9ba8444ae3e54c2')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
