pkgname=ant-bloody-gtk-theme
pkgver=1.0.3
pkgrel=2
pkgdesc="Ant Bloody Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1510377052/Ant-Bloody.tar")
md5sums=('ed3a4434179c783318fea79c518ca1ae')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
