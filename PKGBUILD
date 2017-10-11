pkgname=ant-dracula-gtk-theme
pkgver=0.8
pkgrel=1
pkgdesc="Ant Dracula Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1507003564/Ant-Dracula.tar.xz")
md5sums=('059b2b9bc4b95b7c2b20e5a3ee35b3be')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
