# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=openprinting-ppds-pxlcolor-ricoh
pkgver=20160218
pkgrel=1
pkgdesc="PPD files for Ricoh's PCL colour printers, supplied by Ricoh"
arch=('any')
url='https://www.openprinting.org/driver/pxlcolor-Ricoh'
license=('MIT')
depends=(cups ghostscript)
conflicts=(ppd-ricoh)
install=driver.install
source=('https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-ppds-pxlcolor-ricoh-20160218-1lsb3.2.noarch.rpm')
md5sums=('56f612dfc6c594493f64e60bd61e7ba1')

package() {
  install -d $pkgdir/usr/share/cups/model/Ricoh $pkgdir/usr/share/doc/openprinting-ppds-pxlcolor-ricoh
  install $srcdir/opt/OpenPrinting-Ricoh/ppds/Ricoh/* $pkgdir/usr/share/cups/model/Ricoh/
  install $srcdir/opt/OpenPrinting-Ricoh/doc/openprinting-ppds-pxlcolor-ricoh/* $pkgdir/usr/share/doc/openprinting-ppds-pxlcolor-ricoh/
}
