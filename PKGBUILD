# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=1.1.0
_commit='ff4584376b9956e1147804ed3a6b19c5d3376768'
sha256sums=('244569b40f5efbeac916f239a996c55c0c4711de99d8696c8f77a8883ea067ea')

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
