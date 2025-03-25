# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='ttf-elice-digital-coding'
fontname='EliceDigitalCoding'
pkgver=1.2
pkgrel=2
pkgdesc="A digital monospaced font with JP/KR support, made by elice."
arch=('any')
provides=('ttf-elice-digital-coding')
conflicts=('elice-digital-coding-variable')
url='https://elice.io'
pkgurl='https://font.elice.io/static/downloads/'
license=('custom:SIL Open Font License v1.1')
source=("${pkgurl}${fontname}_TTF.zip")
sha256sums=('2aa9773316b0c963343f7ebf930e2a4082390213100ad4f866018ade354c0e52')
package_ttf-elice-digital-coding() {
	install -dm 755 "$pkgdir/usr/share/fonts/TTF"
	install -m 644 *_Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Regular.ttf"
	install -m 644 *_Bold.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Bold.ttf"
}
