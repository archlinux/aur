# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='elice-digital-coding-variable'
fontname='EliceDigitalCoding'
pkgver=1.2
pkgrel=2
pkgdesc="A digital monospaced font with JP/KR support, made by elice."
arch=('any')
provides=(
    'elice-digital-coding-variable'
    'otf-elice-digital-coding'
    'ttf-elice-digital-coding'
)
conflicts=(
    'otf-elice-digital-coding'
    'ttf-elice-digital-coding'
)
url='https://elice.io'
pkgurl='https://font.elice.io/static/downloads/'
license=('custom:SIL Open Font License v1.1')
source=(
    "${pkgurl}${fontname}_OTF.zip"
    "${pkgurl}${fontname}_TTF.zip"
)
sha256sums=(
    '7f524a63d4d1503ead833ec8986eef81547e251d82628bd1ebaf2f7a4a9fe025'
    '2aa9773316b0c963343f7ebf930e2a4082390213100ad4f866018ade354c0e52'
)

package_elice-digital-coding() {
    pkgdesc+=" (OTF)"
	install -dm 755 "$pkgdir/usr/share/fonts/OTF"
	install -m 644 ${fontname}OTF_Regular.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Regular.otf"
	install -m 644 ${fontname}OTF_Bold.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Bold.otf"

    pkgdesc+=" (TTF)"
    install -dm 755 "$pkgdir/usr/share/fonts/TTF"
	install -m 644 ${fontname}_Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Regular.ttf"
	install -m 644 ${fontname}_Bold.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Bold.ttf"
}