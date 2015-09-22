# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=openprinting-ppds-pxlcolor-ricoh
pkgver=20140319
pkgrel=1
pkgdesc="PPD files for Ricoh's PCL colour printers, supplied by Ricoh"
arch=('any')
url='https://www.openprinting.org/driver/pxlcolor-Ricoh'
license=('MIT')
depends=(cups ghostscript)
conflicts=(ppd-ricoh openprinting-ppds-postscript-ricoh)
install=driver.install
source=('https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-ppds-pxlcolor-ricoh-20140319-1lsb3.2.noarch.rpm')
md5sums=('7aba41f56bf93fd9e6f21aa27c6b1792')

package() {
  install -d $pkgdir/usr/share/cups/model/Ricoh $pkgdir/usr/share/doc/openprinting-ppds-pxlcolor-ricoh
  install $srcdir/opt/OpenPrinting-Ricoh/ppds/Ricoh/* $pkgdir/usr/share/cups/model/Ricoh/
  install $srcdir/opt/OpenPrinting-Ricoh/doc/openprinting-ppds-pxlcolor-ricoh/* $pkgdir/usr/share/doc/openprinting-ppds-pxlcolor-ricoh/
}
