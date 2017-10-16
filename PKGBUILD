pkgname=ant-gtk-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1508040109/Ant.tar.xz")
md5sums=('09b6cdf4cd80850c52cf08056cd43f5e')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
