pkgname=osx-arc-white
pkgver=1.3.9
pkgrel=1
pkgdesc="OSX-Arc-White Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
makedepends=('unzip')
source=("https://dl.opendesktop.org/api/files/download/id/1488643195/OSX-Arc-White-v1.3.9.tar.gz")
md5sums=('c3c6290937dd5735876103e07a1af3df')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
