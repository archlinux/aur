# Maintainer: baraclese at gmail dot com
pkgname=ttf-kh-dotfont
pkgver=1.00.20150527
pkgrel=1
pkgdesc='15 japanese bitmap fonts with sizes from 12px to 32px'
url='http://jikasei.me/font/kh-dotfont/'
arch=('any')
license=('OFL')
source=('http://mirrors.dotsrc.org/osdn/users/8/8545/khdotfont-20150527.7z')
sha256sums=('37e07933056c0d5882924cb4cfea0989532dfa0436d7b840025443e7f7e16032')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
	install -Dm 644 'README_KHDotFont.txt' "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm 644 'SIL_Open_Font_License_1.1.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}