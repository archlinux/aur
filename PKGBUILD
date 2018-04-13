# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=20180413
_commit='71e4eaf70e77cfde959e38e005954199e75cf007'
sha256sums=('1484985a5a9d334201a217e0004c43b2064fd343204b3f2041726c83de76dbe3')

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
