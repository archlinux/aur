pkgname=ant-dracula-gtk-theme
pkgver=1.0.2
pkgrel=1
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1508559214/Ant-Dracula.tar.xz")
md5sums=('82097f5022c264dab275323b12192e06')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
