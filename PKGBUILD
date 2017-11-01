# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=openprinting-ppds-pxlmono-ricoh
pkgver=20161206
pkgrel=2
pkgdesc="PPD files for Ricoh's PCL monochrome printers, supplied by Ricoh"
arch=('any')
url='https://www.openprinting.org/driver/pxlmono-Ricoh'
license=('MIT')
depends=(cups ghostscript cups-filters)
conflicts=(ppd-ricohh)
install=driver.install
source=('https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-ppds-pxlmono-ricoh-20161206-1lsb3.2.noarch.rpm')
sha256sums=('516d828c24b799c89722f371fabaec966e2c0e1cd7712c5b7d34a3adbb70d61a')

package() {
  install -d $pkgdir/usr/share/cups/model/Ricoh $pkgdir/usr/share/doc/openprinting-ppds-pxlmono-ricoh
  install $srcdir/opt/OpenPrinting-Ricoh/ppds/Ricoh/* $pkgdir/usr/share/cups/model/Ricoh/
  install $srcdir/opt/OpenPrinting-Ricoh/doc/openprinting-ppds-pxlmono-ricoh/* $pkgdir/usr/share/doc/openprinting-ppds-pxlmono-ricoh/
}
