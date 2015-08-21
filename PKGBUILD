# Original author: Nicholas Helke <nhelke@gmail.com>
pkgname=openprinting-ppds-postscript-ricoh
pkgver=20140829
pkgrel=1
pkgdesc="PPD files for Ricoh's PostScript printers, supplied by Ricoh"
arch=('any')
url="https://www.openprinting.org/driver/Postscript-Ricoh"
license=('MIT')
depends=('cups' 'cups-filters' 'ghostscript')
conflicts=(ppd-ricoh)
install=ricoh.install
source=("https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-ppds-postscript-ricoh-$pkgver-1lsb3.2.noarch.rpm")

package() {
  install -d $pkgdir/usr/share/cups/model/ $pkgdir/opt/OpenPrinting-Ricoh/doc
  install $srcdir/opt/OpenPrinting-Ricoh/ppds/Ricoh/* $pkgdir/usr/share/cups/model/
  cp -r $srcdir/opt/OpenPrinting-Ricoh/doc $pkgdir/opt/OpenPrinting-Ricoh/doc
}
sha512sums=('9ba9471a3a68d1fc4bc134b0468df18fe727cc3c7a6caae762acd0bc4e87e363fb5f2172378bd676c84a170fe4815b323257a4a5284c8ac694e9781d018a5ac4')
