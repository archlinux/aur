# Maintainer: Quan Guo <guotsuan@gmail.com>
pkgname=ricoh-sp2200-sp3xx-ppds
pkgver=1.0
pkgrel=1
pkgdesc="PPD files for Ricoh's SP2200 and SP300 seriers (SP2200, SP320xxx, SP325xxx, SP377xxx) multifunction printers, supplied by Ricoh"
arch=('any')
url='http://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp320sn/sp320sn.htm'
license=('MIT')
depends=(cups ghostscript cups-filters)
conflicts=()
install=driver.install
source=('sp_2200_300mf_pcl-1.01-0.noarch.rpm')
md5sums=('afbb6d22c2a8b49722663eebf7ca7aa5')

package() {
  install -d $pkgdir/usr/share/doc/Ricoh
  install -d $pkgdir/usr/share/cups/model/Ricoh
  install $srcdir/usr/share/cups/model/ricoh/*.xml $pkgdir/usr/share/doc/Ricoh/
  install $srcdir/usr/share/cups/model/ricoh/primax-gstopxl/* $pkgdir/usr/share/cups/model/Ricoh/
}
