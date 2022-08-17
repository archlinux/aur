# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='ttf-elice-digital-coding'
fontname='EliceDigitalCoding'
pkgver=1.2
pkgrel=1
pkgdesc="A digital monospaced font with JP/KR support, made by elice."
arch=('any')
provides=('ttf-elice-digital-coding')
conflicts=('elice-digital-coding-variable')
url='https://elice.io'
license=('custom:SIL Open Font License v1.1')
source=("$url/font/${fontname}_TTF.zip")
sha256sums=('ac7c59b147a8ea9015a38d899c8be9b150439328c321e5b703a1e962c2341d64')

package_ttf-elice-digital-coding() {
	install -dm 755 "$pkgdir/usr/share/fonts/TTF"
	install -m 644 ${fontname}_Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Regular.ttf"
	install -m 644 ${fontname}_Bold.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Bold.ttf"
}