pkgname=ant-gtk-theme
pkgver=0.8
pkgrel=1
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1507003574/Ant.tar.xz")
md5sums=('a132807aee4a793fb201a31992e450e6')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
