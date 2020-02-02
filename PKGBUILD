# Maintainer: Vincent Bogdan Schult <viboschu@gmail.com>

pkgname=brother-hl6180dw-cups-bin
pkgver=3.0.0_1
pkgrel=1
pkgdesc="CUPS wrapper for Brother HL-6180DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hl6180dw_all"
license=("EULA")
groups=("base-devel")
source=("http://www.brother.com/pub/bsc/linux/dlf/hl6180dwcupswrapper-3.0.0-1.i386.deb")
md5sums=("0683cb26b82a5f5e64012d135685e108")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
