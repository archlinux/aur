# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>

pkgname=brother-dcpl660dw-cups-bin
pkgver=3.5.1
pkgrel=2
pkgdesc="CUPS wrapper for Brother HL-L8360CDW printer"
arch=("i686" "x86_64")
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hll8360cdw_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf102598/dcpl6600dwcupswrapper-3.5.1-1.i386.deb")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
	 mkdir -p -m 755 "${pkgdir}"/usr/share/cups/model
	 mkdir -p -m 755 "${pkgdir}"/usr/lib/cups/filter
	 ln -s /opt/brother/Printers/DCPL6600DW/cupswrapper/brother-DCPL6600DW-cups-en.ppd "${pkgdir}"/usr/share/cups/model/DCPL6600DW-cups-en.ppd
   ln -s /opt/brother/Printers/DCPL6600DW/cupswrapper/ldpwrapper "${pkgdir}"/usr/lib/cups/filter/brother_lpdwrapper_DCPL6600DW
}
sha256sums=('3f3d2eb9dd48a29a7fc416481b33f4c918334c7b3fc4b2ce0f2640b92626dee5')
