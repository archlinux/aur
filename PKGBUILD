# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='otf-elice-digital-coding'
fontname='EliceDigitalCoding'
pkgver=1.2
pkgrel=1
pkgdesc="A digital monospaced font with JP/KR support, made by elice."
arch=('any')
provides=('otf-elice-digital-coding')
conflicts=('elice-digital-coding-variable')
url='https://elice.io'
pkgurl='https://font.elice.io/static/downloads/'
license=('custom:SIL Open Font License v1.1')
source=("${pkgurl}${fontname}_OTF.zip")
sha256sums=('7f524a63d4d1503ead833ec8986eef81547e251d82628bd1ebaf2f7a4a9fe025')

package_otf-elice-digital-coding() {
	install -dm 755 "$pkgdir/usr/share/fonts/OTF"
	install -m 644 ${fontname}OTF_Regular.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Regular.otf"
	install -m 644 ${fontname}OTF_Bold.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Bold.otf"
}