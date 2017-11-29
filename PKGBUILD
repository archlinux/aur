pkgname=ant-gtk-theme
pkgver=1.0.3
pkgrel=3
pkgdesc="Ant Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1511326909/Ant.tar")
md5sums=('dad8e83340d4d7c8d90567ebe8445e38')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
