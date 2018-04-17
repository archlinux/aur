# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=20180417
_commit='d8c7be8afedacfb8664266eff41f1ed5b4d56297'
sha256sums=('89abd4996d2652a99f2ee0982d9dd10a2b1fd85c497052b654fc4c4d9f542355')

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
