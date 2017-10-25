pkgname=ant-bloody-gtk-theme
pkgver=1.0.2
pkgrel=1
pkgdesc="Ant Bloody Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1508559193/Ant-Bloody.tar.xz")
md5sums=('caaf3c19d2a04321486d20892d078ec6')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
