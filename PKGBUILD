# Original author: Nicholas Helke <nhelke@gmail.com>
pkgname=openprinting-ppds-postscript-ricoh
pkgver=20160606
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
sha512sums=('b57b5803c3d71c12495c6bfac6d70ce24119255244b5cb27b230e25aedb746de6c0b08678b95a63b90c0dd5c1dd81a803b7b389a270ce3f1b07d505bee2bb047')
