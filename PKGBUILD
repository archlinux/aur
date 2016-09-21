pkgname=slate-gtk3
pkgver=3.22
pkgrel=1
pkgdesc="Slate Theme for GTK3"
arch=(any)
url=https://www.gnome-look.org/p/1154396/
depends=('gtk3')
makedepends=('unzip')
source=("https://dl.opendesktop.org/api/files/download/id/1474449952/Slate-3.22.zip")
md5sums=('b9d9d547b6240b65b15a01c93de86cb8')

package(){
	cd "$srcdir"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
