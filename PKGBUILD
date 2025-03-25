# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='elice-digital-baeum-variable'
fontname='EliceDigitalBaeum'
pkgver=1.2
pkgrel=5
pkgdesc="A digital sans-serif font with JP/KR support, made by elice."
arch=('any')
provides=(
	'elice-digital-baeum-variable'
	'ttf-elice-digital-baeum'
	'otf-elice-digital-baeum'
)
conflicts=(
	'ttf-elice-digital-baeum'
	'otf-elice-digital-baeum'
)
url='https://font.elice.io'
pkgurl='https://font.elice.io/static/downloads/'
license=('custom:SIL Open Font License v1.1')
source=(
	"${pkgurl}${fontname}_OTF.zip"
	"${pkgurl}${fontname}_TTF.zip"
)
sha256sums=(
	'a660d3a9ec25f1516a3b2401c4857bf9422f9b0d29788d032ee82114ebc41821'
	'9e2fc40ac8dc1e6faa5aff5d89dd45462b498513a9918f2f80200876f7ecc72b'
)

package_elice-digital-baeum-variable() {
	install -dm 755 "$pkgdir/usr/share/fonts/OTF"
	install -m 644 ${fontname}OTF_Regular.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Regular.otf"
	install -m 644 __MACOSX/._${fontname}OTF_Regular.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-MacOS-Regular.otf"
	install -m 644 ${fontname}OTF_Bold.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Bold.otf"
	install -m 644 __MACOSX/._${fontname}OTF_Bold.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-MacOS-Bold.otf"

	install -dm 755 "$pkgdir/usr/share/fonts/TTF"
	install -m 644 ${fontname}_Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Regular.ttf"
	install -m 644 __MACOSX/._${fontname}_Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-MacOS-Regular.ttf"
	install -m 644 ${fontname}_Bold.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Bold.ttf"
	install -m 644 __MACOSX/._${fontname}_Bold.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-MacOS-Bold.ttf"
}