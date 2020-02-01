# Maintainer: Evan LeClercq <eleclercq@tuta.io>

pkgname=brother-mfc-j995dw-print-driver
pkgver=1.0.5
pkgrel=0
pkgdesc="Print driver for Brother MFC-J995DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj995dw_us"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103811/mfcj995dwpdrv-1.0.5-0.i386.deb")
md5sums=("80dd1db70a3086e9003d578f23ac7f3a")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}

