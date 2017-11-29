pkgname=ant-bloody-gtk-theme
pkgver=1.0.3
pkgrel=3
pkgdesc="Ant Bloody Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1511326936/Ant-Bloody.tar")
md5sums=('f3cf3dec27958b8c2242ea61d0efd70f')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
