# Maintainer: Hokuto <abrahamhokuto@outlook.com>

pkgrel=1
pkgver=20180508
_commit='b26d826fafa8ad0164fce493848efcafe351de58'

pkgname=windows-xp-themes-git
pkgdesc='All 7 of Windows XP themes available for Linux'
arch=('any')
url='https://github.com/B00merang-Project/WinXP-themes'
license=('GPL')
source=("https://github.com/B00merang-Project/WinXP-themes/archive/$_commit.zip")
sha256sums=('2dc3452a8b02052d05115a3a829b72448593e3826184eb5701b2aa9baa67a815')

package() {
	cd $srcdir/WinXP-themes-$_commit
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
