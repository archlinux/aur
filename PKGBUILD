# Maintainer: IrreleventIdiot <irreleventidiot@gmail.com>
pkgname=brother-mfc8710dw-cups-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-8710DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfc8710dw_us"
license=("EULA")
source=("https://download.brother.com/welcome/dlf006373/mfc8710dwcupswrapper-3.0.0-1.i386.deb")
md5sums=("0e9e7f4b4fa62622e133d2467ea7c8ba")
package() {
	tar -xf data.tar.gz -C "${pkgdir}"
	mkdir -p -m 755 "${pkgdir}"/usr/share/cups/model
	mkdir -p -m 755 "${pkgdir}"/usr/lib/cups/filter
	ln -s /opt/brother/Printers/MFC8710DW/cupswrapper/brother-MFC-8710DW-cups-en.ppd "${pkgdir}"/usr/share/cups/model/brother-MFC-8710DW-cups-en.ppd
	ln -s /opt/brother/Printers/MFC8710DW/cupswrapper/brother_lpdwrapper_MFC8710DW "${pkgdir}"/usr/lib/cups/filter/brother_lpdwrapper_MFC8710DW
}

