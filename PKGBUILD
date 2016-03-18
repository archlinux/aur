# Original author: Nicholas Helke <nhelke@gmail.com>
pkgname=openprinting-ppds-postscript-ricoh
pkgver=20160227
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
sha512sums=('5654bccdef345658d4d045f4b47f676769536d3252c119ae4759da0edc40a38bc486bf70f6ad43e49b62a4c6fe46db255d424822ba7bdfcb778022c6c03d3031')
