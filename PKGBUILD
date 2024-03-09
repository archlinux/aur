# Maintainer: Miha Korenjak <miha at korenjak dot si>

pkgname=sictools
pkgver=2.1.0
pkgrel=2
pkgdesc="Tools for SIC/XE hypotetical computer"
arch=("any")
license=("BSD-2-Clause")
url="https://github.com/jurem/SicTools"
depends=("java-runtime" "bash")
source=("${pkgname}.jar::${url}/releases/download/v${pkgver}/${pkgname}.jar"
	"sictools"
	"sictools.desktop"
	"LICENSE"
	)
sha512sums=('7ced5bf922efabf80b0cffa1f344de7526b3f85d65b1969eb7ef8e43d7d32556552e9e033cb80a2bb107f2c5601999bdd79d808445f5a2e2a4a2f427f0854238'
            'edeec714008b00667420bdd881ceeec5b66e97b83a7ba34888f3a09f00a719b9db5a546553035bcb1bc1860ba396f13343e1be0f0f590922dd640015e538149f'
            'aefa3d24d550160685778af9a687c18425534535fcf6c1309ab744de1916e9b41bfdce24bc206b7453150a688840b0892e72a1279f3be6c4ac292816744c8e81'
            '16e77873ddfed0d43bfa26f262ea23cf17cf02503816cb94bacd6a25d700c77aca64fb3f69903003bbfabbed85fd38b375602b55c052d96f3ae74fc4467eff54')

package() {
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
