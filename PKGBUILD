pkgname=ant-dracula-gtk-theme
pkgver=1.0.3
pkgrel=1
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1509163141/Ant-Dracula.tar.xz")
md5sums=('047febd7558f0361465ce695e83017d7')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
