# Maintainer: Duane Griffin <duaneg@dghda.com>

pkgname=brother-mfc-8510dn-cups-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-8510DN printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=nz&lang=en&prod=mfc8510dn_eu_as_cn"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006338/mfc8510dncupswrapper-3.0.0-1.i386.deb")
md5sums=("2d0c1f1a89f914b948a171b3d8c548e7")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
	install -m 755 -D "${pkgdir}/opt/brother/Printers/MFC8510DN/cupswrapper/brother_lpdwrapper_MFC8510DN" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_MFC8510DN"
}
