pkgname=ant-dracula-gtk-theme
pkgver=1.0.3
pkgrel=2
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1510031140/Ant-Dracula.tar")
md5sums=('55b70cc6e77cd4bbeca18f715e917a32')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
