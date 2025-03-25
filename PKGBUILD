# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='otf-elice-digital-baeum'
fontname='EliceDigitalBaeum'
pkgver=1.2
pkgrel=2
pkgdesc="A digital sans-serif font with JP/KR support, made by elice."
arch=('any')
provides=('otf-elice-digital-baeum')
conflicts=('elice-digital-baeum-variable')
url='https://font.elice.io'
pkgurl='https://font.elice.io/static/downloads/'
license=('custom:SIL Open Font License v1.1')
source=("${pkgurl}${fontname}_OTF.zip")
sha256sums=('a660d3a9ec25f1516a3b2401c4857bf9422f9b0d29788d032ee82114ebc41821')

package_otf-elice-digital-baeum() {
	install -dm 755 "$pkgdir/usr/share/fonts/OTF"
	install -m 644 ${fontname}OTF_Regular.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Regular.otf"
	install -m 644 ${fontname}OTF_Bold.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Bold.otf"
}

