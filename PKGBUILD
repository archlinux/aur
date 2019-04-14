# Maintainer: Hokuto <abrahamhokuto@outlook.com>

pkgver=20190414
pkgrel=1
pkgname=windows-xp-themes-git
_pkgname=Windows-XP-master
pkgdesc='All 7 of Windows XP themes available for Linux'
arch=('any')
url='https://github.com/B00merang-Project/WinXP-themes'
license=('GPL')
source=("https://github.com/B00merang-Project/Windows-XP/archive/master.zip")
sha256sums=('6d9e17a482ab837e456494400b3810d986eac58509b59a738d03032d61a91724')

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
