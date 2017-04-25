pkgname=osx-arc-white
pkgver=1.4.1
pkgrel=1
pkgdesc="OSX-Arc-White Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
makedepends=('unzip')
source=("https://dl.opendesktop.org/api/files/download/id/1492458057/OSX-Arc-White-v1.4.1.tar.gz")
md5sums=('ff91677d23f7118b7ccd8ef1d6facea1')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
