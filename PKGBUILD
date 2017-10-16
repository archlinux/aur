pkgname=ant-bloody-gtk-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="Ant Bloody Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1508040101/Ant-Bloody.tar.xz")
md5sums=('d8565ca7c2418386fe9eb9ec10c1ddbc')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
