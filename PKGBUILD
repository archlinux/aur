# Maintainer: Carl George < arch at cgtx dot us >

pkgname="ppd-xerox-colorqube9200"
pkgver="1.0.7"
pkgrel="1"
pkgdesc="Printer driver for Xerox ColorQube 9201/9202/9203"
arch=("any")
url="http://www.support.xerox.com/support/colorqube-9201-9202-9203/support/enus.html"
license=("custom")
depends=("cups")
source=("http://download.support.xerox.com/pub/drivers/CQ9201_CQ9202_CQ9203/drivers/winxp/en_GB/ColorQube-9201_Win-ppd_1.0.7_English.zip"
	"LICENSE")
sha256sums=("b56a595deef569282e02b3835cfba319115ee83b13d7481308cb57bd4475b47d"
            "8f59224cc9f66afd77f54200f56f88b4d34b1516f415ca9888d0045b82bdf335")

package() {
	install -Dpm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dpm0644 "${srcdir}/English/xrx9201.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/Xerox-ColorQube9201.ppd"
	install -Dpm0644 "${srcdir}/English/xrx9202.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/Xerox-ColorQube9202.ppd"
	install -Dpm0644 "${srcdir}/English/xrx9203.ppd" "${pkgdir}/usr/share/ppd/cupsfilters/Xerox-ColorQube9203.ppd"
}
