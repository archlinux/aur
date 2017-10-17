# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=openprinting-ppds-pxlcolor-generic
pkgver=1.1
pkgrel=3
pkgdesc="Generic PPD for PCL colour printers"
arch=('any')
url='http://www.openprinting.org/printer/Generic/Generic-PCL_6_PCL_XL_Printer'
license=('MIT')
depends=(cups ghostscript)
install=driver.install
source=('Generic-PCL_6_PCL_XL_Printer-pxlcolor.ppd')
sha256sums=('0f3a27ddec734165396b04e794335c45d30d5a8297078cf4f6d9d933244a6033')

package() {
  install -d $pkgdir/usr/share/cups/model
  install Generic-PCL_6_PCL_XL_Printer-pxlcolor.ppd $pkgdir/usr/share/cups/model/
}
