pkgname=ant-bloody-gtk-theme
pkgver=1.0.3
pkgrel=1
pkgdesc="Ant Bloody Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1509163129/Ant-Bloody.tar.xz")
md5sums=('8f970408b07b1df2ce45169184e9b932')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
