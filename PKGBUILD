# Maintainer : n34r <near1297 at icloud dot com>
# Derived from udev-media-automount by Ferk
# EasyArch Project

pkgname="ntfs-automount"
pkgdesc="Automount NTFS drives using an udev rule"
pkgver=0.3
pkgrel=0
url='https://github.com/n34r1297/easyarch/aur/ntfs-automount/'
license=('GPL3')
arch=('any')
groups=('easyarch')
depends=('udev' 'ntfs-3g')
source=(https://github.com/n34r1297/easyarch/raw/master/aur/ntfs-automount/Releases/$pkgname-$pkgver.tar.gz)
md5sums=('137c340aa3d39cd5e484d579da03b8f8')
		  
package() {
	install -D "$srcdir/ntfs-automount.rules" "$pkgdir/usr/lib/udev/rules.d/99-ntfs-automount.rules"
	install -D "$srcdir/ntfs-automount" "$pkgdir/usr/bin/ntfs-automount"
	install -D "$srcdir/ntfs-automount@.service" "$pkgdir/usr/lib/systemd/system/ntfs-automount@.service"
}
