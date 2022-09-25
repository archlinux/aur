# Maintainer: Estevan Küster <estevan.kuster8@gmail.com>
pkgname=brother-mfcj4310dw-cups-bin
pkgver=3.0.1_1
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-J4310DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj4310dw_us"
license=("GPL2")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006992/mfcj4310dwcupswrapper-${pkgver//_/-}.i386.deb")
md5sums=('b34916d9fe955c88161a22c927a174a0')

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
