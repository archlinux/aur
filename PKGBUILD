# Maintainer: Jeff Sacco <trailjeep-at-gmail-dot-com>

pkgname=hacked-aio-righty
pkgver=1.0.0
pkgrel=1
pkgdesc="Hacked-aio Cursor Theme for Righties"
arch=('any')
url="https://store.kde.org/content/show.php?content=176043"
license=('CCPL')
source=("https://www.dropbox.com/s/jpvh2km9udtjoju/Hacked-aio.tgz")
md5sums=('473bb7c66bd8ead96a6a9bbe1f0b099f')

package() {
	cd $srcdir/Hacked-aio
	install -d    $pkgdir/usr/share/icons/$pkgname
	cp -rf *      $pkgdir/usr/share/icons/$pkgname
	chmod -R 0644 $pkgdir/usr/share/icons/$pkgname
	chmod 0755    $pkgdir/usr/share/icons/$pkgname
	chmod 0755    $pkgdir/usr/share/icons/$pkgname/cursors
}
