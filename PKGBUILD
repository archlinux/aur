# Maintainer: Estevan Küster <estevan.kuster8@gmail.com>
pkgname=brother-mfcj4310dw-lpr-bin
pkgver=3.0.1_1
pkgrel=1
pkgdesc="LPR driver for Brother MFC-J4310DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj4310dw_us"
license=("GPL2")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006990/mfcj4310dwlpr-${pkgver//_/-}.i386.deb")
md5sums=('28eab84848d043d624fbfa46a4a86fbf')

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
