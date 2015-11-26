# Contributor: Esclapion <esclapion@gmail.com>
# Maintainer: BlindPenguin <f.holzner@limeonfire.de>

pkgname=azenis-green-icon-theme
pkgver=1
pkgrel=3
pkgdesc="Azenis green icon theme"
arch=('any')
license=('GPL')
url=('http://gnome-look.org/content/show.php/Azenis+Icons+Green?content=126630')
source=('http://limeonfire.de/aur/azenis/AzenisIconsGreen.tar.gz')
md5sums=('c6938f95250a215c6cd554c24243a886')

package() {

	mkdir -p $pkgdir/usr/share/icons/
	cp -r "$srcdir/Azenis Icons Green" $pkgdir/usr/share/icons/
	# icon size bugfix
	#sed -i 's/devices,,/devices,/' "$pkgdir/usr/share/icons/Azenis-Green/index.theme"
}
