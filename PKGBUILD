# Contributor: EEva <eeva+aur@marvid.fr>
# Based on package by: Thomas Kinnen <thomas.kinnen@gmail.com>
pkgname=ppd-dell-5130cdn
provides="ppd-dell-5130cdn"
pkgdesc="Printer only driver for the Dell 5130cdn Color Laser Printer"
url="http://ftp.dell.com/Browse_For_Drivers/Printers%20&%20Imaging%20Solutions/Printer/Dell%205130cdn%20Color%20Laser%20Printer/"
pkgver=1.3
pkgrel=2
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
makedepends=('rpmextract')
source=('ftp://ftp.dell.com/printer/Dell-5130cdn-Color-Laser-1.3-1.noarch.rpm')
md5sums=('7fb7122e67e40b99deb9665d88df62d1')

package() {
	cd ${pkgdir}
    rpmextract.sh ${srcdir}/Dell-5130cdn-Color-Laser-1.3-1.noarch.rpm
}

