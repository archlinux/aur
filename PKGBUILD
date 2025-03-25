# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='ttf-elice-digital-baeum'
fontname='EliceDigitalBaeum'
pkgver=1.2
pkgrel=3
pkgdesc="A digital sans-serif font with JP/KR support, made by elice."
arch=('any')
provides=('ttf-elice-digital-baeum')
conflicts=('elice-digital-baeum-variable')
url='https://font.elice.io'
pkgurl='https://font.elice.io/static/downloads/'
license=('custom:SIL Open Font License v1.1')
source=("${pkgurl}${fontname}_TTF.zip")
sha256sums=('9e2fc40ac8dc1e6faa5aff5d89dd45462b498513a9918f2f80200876f7ecc72b')

package_ttf-elice-digital-baeum() {
	install -dm 755 "$pkgdir/usr/share/fonts/TTF"
	install -m 644 ${fontname}_Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Regular.ttf"
	install -m 644 ${fontname}_Bold.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Bold.ttf"
}

