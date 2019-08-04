# Maintainer: Hokuto <abrahamhokuto@outlook.com>

pkgver=20190621
pkgrel=1
pkgname=windows-xp-themes-git
_pkgname=Windows-XP-master
pkgdesc='All 7 of Windows XP themes available for Linux'
arch=('any')
url='https://github.com/B00merang-Project/WinXP-themes'
license=('GPL')
source=("https://github.com/B00merang-Project/Windows-XP/archive/master.zip")
sha256sums=('5b1f7e75f4e70e4106708eb1a031f8f61c12eb67f7ba7485ee6929e3646ceae2')

package() {
	cd $srcdir/$_pkgname
	mkdir -p $pkgdir/usr/share/themes
	cp -r \
		'Windows XP Embedded' \
		'Windows XP Homestead' \
		'Windows XP Luna' \
		'Windows XP Metallic' \
		'Windows XP Royale Dark' \
		'Windows XP Royale' \
		'Windows XP Zune' \
		$pkgdir/usr/share/themes

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
