# Maintainer: Gordon Chan <gc@gondro.xyz>

pkgname='ttf-rounded-mgenplus'
pkgver=1.059.20150602
pkgrel=1
pkgdesc="Rounded M+ OUTLINE FONTS as base with modified glyphs from Source Han Sans JP fonts"
arch=(any)
url="http://jikasei.me/font/rounded-mgenplus"
license=('OFL')
source=(https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8598/rounded-mgenplus-20150602.7z)
md5sums=('SKIP')

package() {
	install -dm755 ${pkgdir}/usr/share/fonts/TTF
	install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}

	install -Dm644 *.ttf ${pkgdir}/usr/share/fonts/TTF  
	install -Dm644 ${srcdir}/SIL_Open_Font_License_1.1.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
