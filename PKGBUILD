pkgname=adwaita-dark
pkgver=1.0
pkgrel=1
pkgdesc="A dark GTK2 theme for use alongside the dark variant of GTK3 Adwaita"
arch=('i686' 'x86_64')
url="https://www.gnome-look.org/p/1099669/"
license=('GPL')
depends=('gtk2')
source=("175933-AdwaitaDark.tar.gz")
md5sums=('dde4aa65fc13ea5c7cfff65000e09b58')

package() {
	cd ${srcdir}/
	mkdir -p ${pkgdir}/usr/share/themes
	cp -r AdwaitaDark ${pkgdir}/usr/share/themes
	chown -R root:root ${pkgdir}/usr/share/themes
}
