# Maintainer: Miha Korenjak <miha at korenjak dot si>

pkgname=sictools
pkgver=2.0.1
pkgrel=1
pkgdesc="Tools for SIC/XE hypotetical computer"
arch=("any")
license=("unknown")
url="https://github.com/jurem/SicTools"
depends=("java-runtime")
source=("${pkgname}.jar::${url}/releases/download/v${pkgver}/${pkgname}.jar"
	"sictools"
	"sictools.desktop")
sha512sums=("97aa7a44cb5c59e8c5288a1009c4382d98834a19a2dc9964dfd73311d1fc283b6e628a4bd725835f10ed6eedf3758f88b8d238ea34e4818fe6335c792b3f7d52"
	"edeec714008b00667420bdd881ceeec5b66e97b83a7ba34888f3a09f00a719b9db5a546553035bcb1bc1860ba396f13343e1be0f0f590922dd640015e538149f"
	"aefa3d24d550160685778af9a687c18425534535fcf6c1309ab744de1916e9b41bfdce24bc206b7453150a688840b0892e72a1279f3be6c4ac292816744c8e81"
)

package() {
	install -D -m755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 ${pkgname}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -D -m644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
