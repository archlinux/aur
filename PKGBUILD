pkgname=ant-gtk-theme
pkgver=1.0.2
pkgrel=1
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1508559201/Ant.tar.xz")
md5sums=('b94573c3c81ac4389c484200367abb50')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
