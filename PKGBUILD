# Maintainer: John Crist (john@crist.io)
pkgname=base-extras
pkgver=20191010
pkgrel=1
pkgdesc='Meta package for all packages removed from base metagroup.'
arch=('any')
url='https://aur.archlinux.org/packages/base-extras/'
license=('custom:Public Domain')
depends=('cryptsetup'
         'device-mapper'
         'dhcpcd'
         'diffutils'
         'e2fsprogs'
         'inetutils'
         'jfsutils'
         'less'
         'linux'
         'linux-firmware'
         'logrotate'
         'lvm2'
         'man-db'
         'man-pages'
         'mdadm'
         'nano'
         'netctl'
         'perl'
         'reiserfsprogs'
         's-nail'
         'sysfsutils'
         'texinfo'
         'usbutils'
         'vi'
         'which'
         'xfsprogs')
source=(LICENSE)
sha256sums=('f6960be1b71d602352d7d9de76a564f54f3dab550b23fa5674049f842116ca55')

package()
{
	cd "$srcdir" || exit
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}