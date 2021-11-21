# Maintainer: Kevin Brandon <staticrealm@gmail.com>

pkgname=brother-mfcl8900cdw-cups-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-L8900CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcl8900cdw_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103251/mfcl8900cdwcupswrapper-1.5.0-0.i386.deb")
md5sums=("3b2a9aea8242acbd430ddbd90d79677f")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
  mkdir -p -m 755 "${pkgdir}"/usr/share/cups/model/Brother
  mkdir -p -m 755 "${pkgdir}"/usr/lib/cups/filter
  ln -s /opt/brother/Printers/mfcl8900cdw/cupswrapper/brother_mfcl8900cdw_printer_en.ppd "${pkgdir}"/usr/share/cups/model/Brother/brother_mfcl8900cdw_printer_en.ppd
  ln -s /opt/brother/Printers/mfcl8900cdw/cupswrapper/brother_lpdwrapper_mfcl8900cdw "${pkgdir}"/usr/lib/cups/filter/brother_lpdwrapper_mfcl8900cdw
}
