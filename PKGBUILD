pkgname=ant-gtk-theme
pkgver=1.0.3
pkgrel=2
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1510031090/Ant.tar")
md5sums=('7b0542418b9326070c3cb83824f46775')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
