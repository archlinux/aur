# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=openprinting-ppds-pxlcolor-ricoh
pkgver=20161206
pkgrel=2
pkgdesc="PPD files for Ricoh's PCL colour printers, supplied by Ricoh"
arch=('any')
url='https://www.openprinting.org/driver/pxlcolor-Ricoh'
license=('MIT')
depends=(cups ghostscript cups-filters)
conflicts=(ppd-ricoh)
install=driver.install
source=('https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-ppds-pxlcolor-ricoh-20161206-1lsb3.2.noarch.rpm')
sha256sums=('7bbe04a056b5d510c868f2a700f444044d4c223b49346db40cf03bff248851b4')

package() {
  install -d $pkgdir/usr/share/cups/model/Ricoh $pkgdir/usr/share/doc/openprinting-ppds-pxlcolor-ricoh
  install $srcdir/opt/OpenPrinting-Ricoh/ppds/Ricoh/* $pkgdir/usr/share/cups/model/Ricoh/
  install $srcdir/opt/OpenPrinting-Ricoh/doc/openprinting-ppds-pxlcolor-ricoh/* $pkgdir/usr/share/doc/openprinting-ppds-pxlcolor-ricoh/
}
