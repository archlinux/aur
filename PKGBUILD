# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=20180507
_commit='853d92beccec821600261543bf06b60338fb87ea'
sha256sums=('e425383d589b1fd7a53b48af98f21cc0006c504d3a8d2101734821bcd18e42fe')

pkgname=redmond-themes-git
pkgdesc='Aims to provide the complete Windows experience for easy use on Linux and GNOME-compatible OSes'
arch=('any')
url='https://github.com/B00merang-Project/Redmond-Themes'
license=('GPL')
source=("https://github.com/B00merang-Project/Redmond-Themes/archive/$_commit.zip")

package() {
	cd $srcdir/Redmond-Themes-$_commit
	mkdir -p $pkgdir/usr/share/themes
	cp -r \
		'Windows 3.11' \
		'Windows 3.x' \
		'Windows 7 Basic' \
		'Windows 7 Blue' \
		'Windows 7' \
		'Windows 8.1' \
		'Windows 95' \
		'Windows 9x' \
		'Windows Vista' \
		$pkgdir/usr/share/themes

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
