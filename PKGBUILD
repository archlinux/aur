# Maintainer: Aline Abler <alinea@riseup.net>

pkgname=ttf-metamorphous
pkgver=20170131
pkgrel=3
pkgdesc='Metamorphous Font'
url="http://sorkintype.com/fonts.html"
license=('custom:OFL')
arch=('any')
source=(Metamorphous.ttf::"https://fonts.gstatic.com/s/metamorphous/v20/Wnz8HA03aAXcC39ZEX5y1330PCCthTsmaQ.ttf"
        OFL.txt)

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('f5405664216eaa1c1433b01da1c23582'
         '6ed93967ff0dc6dd9c8d31c17f817a06')
