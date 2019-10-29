# Maintainer : n34r <near1297 at icloud dot com>
# Derived from udev-media-automount by Ferk
# EasyArch Project

pkgname="ntfs-automount"
pkgdesc="NTFS automount utility based on udev rule"
pkgver=0.2
pkgrel=0
license=('GPL3')
arch=('any')
groups=('easyarch')
depends=('udev')
source=(https://github.com/n34r1297/easyarch/raw/master/aur/ntfs-automount/Releases/$pkgname-$pkgver.tar.gz)
md5sums=('a2f994aae2463922ff7490e0e5a00564')
		  
package() {
	install -D "$srcdir/ntfs-automount.rules" "$pkgdir/usr/lib/udev/rules.d/99-ntfs-automount.rules"
	install -D "$srcdir/ntfs-automount" "$pkgdir/usr/bin/ntfs-automount"
	install -D "$srcdir/ntfs-automount@.service" "$pkgdir/usr/lib/systemd/system/ntfs-automount@.service"
}
