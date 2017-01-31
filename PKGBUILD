# Maintainer: Aline Abler <alinea@riseup.net>

pkgname=ttf-metamorphous
pkgver=20170131
pkgrel=1
pkgdesc='Metamorphous Font'
url="http://sorkintype.com/fonts.html"
license=('custom:OFL')
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(${pkgname}-${pkgver}::"http://www.1001freefonts.com/d/5661/metamorphous.zip"
        'install')

install=install

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF

	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
}
md5sums=('4b84170446d219bea6b290f4eeadd9ad'
         'b9b03309f730947d472a63b0e5ca3bb1')
