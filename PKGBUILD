pkgname=ant-dracula-gtk-theme
pkgver=1.0.3
pkgrel=3
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1511326957/Ant-Dracula.tar")
md5sums=('8028c0f03781c4d479512163fea0a873')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
