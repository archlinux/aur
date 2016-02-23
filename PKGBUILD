# Original author: Nicholas Helke <nhelke@gmail.com>
pkgname=openprinting-ppds-postscript-ricoh
pkgver=20160218
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
sha512sums=('70d032a6968b6b202ec10e9c56afe345116689c4c6e56fd87f9763881ba33d5c4c7effb5ae4e6836abdc44bfe70aac99edfe73320c4b0d2c09d0101a90aaecbf')
