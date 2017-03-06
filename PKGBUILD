pkgname=osx-arc-darker
pkgver=1.3.9
pkgrel=1
pkgdesc="OSX-Arc-Darker Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1488643183/OSX-Arc-Darker-v1.3.9.tar.gz")
md5sums=('0ce75be85fda8af6495671f382ae8cda')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
