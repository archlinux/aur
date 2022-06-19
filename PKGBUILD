# Maintainer : Brian Bidulock <bidulock@openss7.org>
# Contributor : Tobias Powalowski <tpowa@archlinux.org>

pkgname=mkpxelinux
pkgver=2013.10
pkgrel=3
pkgdesc="Advanced, modular network pxe boot image creation utility"
arch=(any)
license=('GPL')
url="http://www.archlinux.org/"
depends=('mkinitcpio' 'tftp-hpa' 'syslinux')
backup=(etc/mkpxelinux.conf)
optdepends=('dhcp: for dhcp server usage')
source=('boot.msg' 'mkpxelinux' 'mkpxelinux.conf' 'options.msg')

package()
{
  cd "$srcdir/"
  install -D -m755 mkpxelinux "$pkgdir/usr/bin/mkpxelinux"
  install -D -m644 mkpxelinux.conf "$pkgdir/etc/mkpxelinux.conf"
  install -D -m644 boot.msg "$pkgdir/usr/share/mkpxelinux/boot.msg"
  install -D -m644 options.msg "$pkgdir/usr/share/mkpxelinux/options.msg"
}
md5sums=('f4a30ab94fdc1974f4fbdfd7235ca512'
         '90dd31f0501df4defdbe975368446f27'
         '1b6aa3d4e77d6d7a61590d242d34a138'
         'b211c5f7e30d2ee36cde20f71aa3f2b8')
