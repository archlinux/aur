# Maintainer: Colin Keenan <colinnkeenan at gmail dot com>
pkgname="dell-5100cn"
pkgver="1.2"
pkgrel=1
pkgdesc="CUPS driver for the Dell Laser Printer 5100cn"
arch=('i686' 'x86_64')
url="http://www.dell.com/support/drivers/us/en/19/product/dell-5100cn"
license=('Adobe PPD')
depends=('cups')
install=${pkgname}.install
source=(http://ftp.us.dell.com/printer/Dell-Laser-Printer-5100cn-1.2-1.noarch.rpm)
md5sums=('bb57ba62c6bfe69db5dfafe7d907c1a8')
package() {
        mkdir -p $pkgdir/usr/share/cups/model
        mkdir -p $pkgdir/usr/share/foomatic/db/source/printer
        mkdir -p $pkgdir/usr/share/foomatic/db/source/opt
	cp $srcdir/usr/share/cups/model/Dell/* $pkgdir/usr/share/cups/model
        cp $srcdir/usr/share/foomatic/db/source/printer/* $pkgdir/usr/share/foomatic/db/source/printer
        cp $srcdir/usr/share/foomatic/db/source/opt/* $pkgdir/usr/share/foomatic/db/source/opt
}
