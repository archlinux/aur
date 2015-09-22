# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=openprinting-ppds-pxlcolor-generic
pkgver=1.1
pkgrel=1
pkgdesc="Generic PPD for PCL colour printers"
arch=('any')
url='http://www.openprinting.org/printer/Generic/Generic-PCL_6_PCL_XL_Printer'
license=('MIT')
depends=(cups ghostscript)
install=driver.install
source=('Generic-PCL_6_PCL_XL_Printer-pxlcolor.ppd')
sha256sums=('0650fbe63ef324022d9304866fe2505f1a5909faea2a7357762903d8569e3f61')

package() {
  install -d $pkgdir/usr/share/cups/model/Ricoh
  install Generic-PCL_6_PCL_XL_Printer-pxlcolor.ppd $pkgdir/usr/share/cups/model/
}
