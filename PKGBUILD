# Maintainer: Jeffrey Lakeman <jeffreylakeman18@gmail.com>

pkgname=brother-mfcj4620dw-cups-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-J4620DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadlist.aspx?&c=au&lang=en&prod=mfcj4620dw_us_eu_as&os=128"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf101136/mfcj4620dwcupswrapper-3.0.1-1.i386.deb")
md5sums=("0e943ff2c2a5d1c58d40b686bfbfd0e6")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
