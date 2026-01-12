# Maintainer: Aline Abler <alinea@riseup.net>

pkgname=ttf-metamorphous
pkgver=20231228
pkgrel=2
pkgdesc='Metamorphous Font'
url="https://fonts.google.com/specimen/Metamorphous"
license=('custom:OFL')
arch=('any')
source=(${pkgname}-${pkgver}-${pkgrel}::"https://fonts.google.com/download?family=Metamorphous")

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('a4720bee833634468c049632ca7445ef')
