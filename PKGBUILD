# Maintainer : n34r <near1297 at icloud dot com>
# Derived from udev-media-automount by Ferk

pkgname="ntfs-automount"
pkgdesc="NTFS automount utility based on udev rule"
pkgver=0.1
pkgrel=1
license=('GPL')
arch=('any')
depends=('udev')
source=(https://github.com/n34r1297/easyarch/raw/master/ntfs-automount/Releases/$pkgname-$pkgver.tar.gz)
md5sums=('e5c62bf991c9757cde00ec6afdf29401')
		  
package() {
	install -D "$srcdir/ntfs-automount.rules" "$pkgdir/usr/lib/udev/rules.d/99-ntfs-automount.rules"
	install -D "$srcdir/ntfs-automount" "$pkgdir/usr/bin/ntfs-automount"
	install -D "$srcdir/ntfs-automount@.service" "$pkgdir/usr/lib/systemd/system/ntfs-automount@.service"
}
