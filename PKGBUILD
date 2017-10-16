pkgname=ant-dracula-gtk-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1508040115/Ant-Dracula.tar.xz")
md5sums=('cc61c837bb61dbbedbe3392908fe707b')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
