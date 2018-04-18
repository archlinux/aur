# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=20180418
_commit='2f27206a0bf9d9ad644c3698b41ebc0c54462b26'
sha256sums=('f47276126c341b4d9ae6fb0097b28e6b907a16859f16cd8c492b3bb91e1037d9')

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
