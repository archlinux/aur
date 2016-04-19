# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=openprinting-ppds-pxlmono-ricoh
pkgver=20160218
pkgrel=1
pkgdesc="PPD files for Ricoh's PCL monochrome printers, supplied by Ricoh"
arch=('any')
url='https://www.openprinting.org/driver/pxlmono-Ricoh'
license=('MIT')
depends=(cups ghostscript)
conflicts=(ppd-ricoh openprinting-ppds-postscript-ricoh)
install=driver.install
source=('https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-ppds-pxlmono-ricoh-20160218-1lsb3.2.noarch.rpm')
md5sums=('ebc9fb76ef197542d77bd384e185978c')

package() {
  install -d $pkgdir/usr/share/cups/model/Ricoh $pkgdir/usr/share/doc/openprinting-ppds-pxlmono-ricoh
  install $srcdir/opt/OpenPrinting-Ricoh/ppds/Ricoh/* $pkgdir/usr/share/cups/model/Ricoh/
  install $srcdir/opt/OpenPrinting-Ricoh/doc/openprinting-ppds-pxlmono-ricoh/* $pkgdir/usr/share/doc/openprinting-ppds-pxlmono-ricoh/
}
