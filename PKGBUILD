# Maintainer: Jeff Sacco <trailjeep-at-gmail-dot-com>

pkgname=hacked-aio-lefty
pkgver=1.0.0
pkgrel=1
pkgdesc="Hacked-aio Cursor Theme for Lefties"
arch=('any')
url="https://store.kde.org/content/show.php?content=176043"
license=('CCPL')
source=("https://www.dropbox.com/s/mk5767mpzxtxvgf/Hacked-aio.tgz")
md5sums=('d293223dfc521e8099ebd308644bb45a')

package() {
	cd $srcdir/Hacked-aio
	install -d    $pkgdir/usr/share/icons/$pkgname
	cp -rf *      $pkgdir/usr/share/icons/$pkgname
	chmod -R 0644 $pkgdir/usr/share/icons/$pkgname
	chmod 0755    $pkgdir/usr/share/icons/$pkgname
	chmod 0755    $pkgdir/usr/share/icons/$pkgname/cursors
}
