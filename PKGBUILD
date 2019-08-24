# Maintainer: Victor Trac <victor.trac@gmail.com>

pkgname=brother-mfcj835dw-cups-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-J835DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=mfcj835dw_us&os=128"
license=("EULA")
depends=("cups" "cups-filters")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006632/mfcj835dwcupswrapper-3.0.0-1.i386.deb")
md5sums=("b56b07a273a05a8ace9f1f59efaa6c88")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
