pkgname=osx-arc-white
pkgver=1.3.7
pkgrel=1
pkgdesc="OSX-Arc-White Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1167049/
depends=('gtk3')
makedepends=('unzip')
source=("https://dl.opendesktop.org/api/files/download/id/1483939002/OSX-Arc-White-v1.3.7.tar.gz")
md5sums=('7fca585e8f33ee78af13999d7184e898')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
