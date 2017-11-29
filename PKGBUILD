pkgname=ant-nebula-gtk-theme
pkgver=1.0.3
pkgrel=3
pkgdesc="Ant Nebula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1511326981/Ant-Nebula.tar")
md5sums=('a18a71424b019043df3cf5243f515d36')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
