pkgname=osx-arc-darker
pkgver=1.4.5
pkgrel=1
pkgdesc="OSX-Arc-Darker Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1511459151/OSX-Arc-Darker-v1.4.5.zip")
md5sums=('458db52fd5a425a58407745e0a9e50fc')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
