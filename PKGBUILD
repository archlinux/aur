# Contributor: EEva <eeva+aur@marvid.fr>
# Based on package by: Thomas Kinnen <thomas.kinnen@gmail.com>
pkgname=ppd-dell-5130cdn
provides=("ppd-dell-5130cdn")
pkgdesc="Printer only driver for the Dell 5130cdn Color Laser Printer"
url="http://www.dell.com/support/home/us/en/04/product-support/product/dell-5130cdn/drivers"
pkgver=1.3
pkgrel=2
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
makedepends=('rpmextract')
source=('http://downloads.dell.com/FOLDER00398524M/1/Dell-5130cdn-Color-Laser-1.3-1.noarch.rpm')
md5sums=('7fb7122e67e40b99deb9665d88df62d1')

package() {
	cd ${pkgdir}
    rpmextract.sh ${srcdir}/Dell-5130cdn-Color-Laser-1.3-1.noarch.rpm
}

