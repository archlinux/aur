# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='elice-dxneolli-variable'
fontname='EliceDXNeolli'
pkgver=1.0
pkgrel=1
pkgdesc="A digital sans-serif font with JP/KR support, made by elice."
arch=('any')
provides=(
	'elice-dxneolli-variable'
	'ttf-elice-dxneolli'
	'otf-elice-dxneolli'
)
conflicts=(
	'ttf-elice-dxneolli'
	'otf-elice-dxneolli'
)
url='https://font.elice.io'
pkgurl='https://font.elice.io/static/downloads/'
license=('custom:SIL Open Font License v1.1')
source=(
	"${pkgurl}${fontname}_OTF.zip"
	"${pkgurl}${fontname}_TTF.zip"
)
sha256sums=(
	'c58ffe46ac0012712b82dbd28e0aafc143c14e1a24cb4afcbcc5fb5ba0de9e3a'
	'41e589f458546f2c863c956c3deba98c5246d87a358a34c0bc45e66307793243'
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