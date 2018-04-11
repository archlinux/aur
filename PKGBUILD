# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=20180411
_commit='0aef4f14d862f956715314cd4b6ce5888ec1b97a'
sha256sums=('ca96d37699741d81137f7e04355a3e321ffaeda7bbf05b244ee6ec467f8b28c3')

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
