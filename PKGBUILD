pkgname=osx-arc-darker
pkgver=1.4.3
pkgrel=1
pkgdesc="OSX-Arc-Darker Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
source=("https://dl.opendesktop.org/api/files/download/id/1496170671/OSX-Arc-Darker-v1.4.3.tar.gz")
md5sums=('1a3c6f25d56d2699ceaacbed3c1c38de')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
