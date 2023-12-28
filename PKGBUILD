# Maintainer: Aline Abler <alinea@riseup.net>

pkgname=ttf-averia-libre
pkgver=20200306
pkgrel=2
pkgdesc='Averia Libre Font'
url="http://iotic.com/averia/"
license=('custom:OFL')
arch=('any')
source=(${pkgname}-${pkgver}-${pkgrel}::"http://iotic.com/averia/font-files/Averia.zip")

package() {
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('dc61396d0f8e3b0130933b1227022c20')
