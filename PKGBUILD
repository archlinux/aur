# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=1.0.0
_commit='0fbf747b80586a3e80a98f196986b7d741bce7db'
sha256sums=('8751711229248b2fee231a6765be595afb86377c18e575ef00802b7b76e3d375')

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
		'Windows 3.x' \
		'Windows 8.1' \
		'Windows 9x' \
		'Windows Se7en' \
		'Windows Se7en Basic' \
		'Windows Se7en Blue' \
		'Windows Vista' \
		$pkgdir/usr/share/themes
}
