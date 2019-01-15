pkgname=newadwaita-gtk-theme
pkgver=20190112
pkgrel=1
pkgdesc="New Adwaita GTK theme"
arch=('any')
url="https://blog.gtk.org/2019/01/14/theme-changes-in-gtk-3/"
license=('GPL')
depends=('gtk3')
source=("https://download.gnome.org/misc/testing/Adwaita/NewAdwaita-1.tar.xz")
md5sums=('a79a8e2d3f87246584c786bc30c1fd25')

package() {
	cd ${srcdir}/
	mkdir -p ${pkgdir}/usr/share/themes
	cp -r NewAdwaita ${pkgdir}/usr/share/themes
	chown -R root:root ${pkgdir}/usr/share/themes
}
