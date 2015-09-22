# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=openprinting-ppds-pxlmono-ricoh
pkgver=20140110
pkgrel=2
pkgdesc="PPD files for Ricoh's PCL monochrome printers, supplied by Ricoh"
arch=('any')
url='https://www.openprinting.org/driver/pxlmono-Ricoh'
license=('MIT')
depends=(cups ghostscript)
conflicts=(ppd-ricoh openprinting-ppds-postscript-ricoh)
install=driver.install
source=('https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-ppds-pxlmono-ricoh-20140110-1lsb3.2.noarch.rpm')
md5sums=('d95c6dea5c555356d92a8f770c0a8f70')

package() {
  install -d $pkgdir/usr/share/cups/model/Ricoh $pkgdir/usr/share/doc/openprinting-ppds-pxlmono-ricoh
  install $srcdir/opt/OpenPrinting-Ricoh/ppds/Ricoh/* $pkgdir/usr/share/cups/model/Ricoh/
  install $srcdir/opt/OpenPrinting-Ricoh/doc/openprinting-ppds-pxlmono-ricoh/* $pkgdir/usr/share/doc/openprinting-ppds-pxlmono-ricoh/
}
