# Maintainer: sunplan
pkgname=ttf-deogon
# version number is not given
pkgver=0
pkgrel=1
pkgdesc='덕온공주체 Deogon Princess (Deokon)'
arch=('any')
url='https://hanfont.hangeul.go.kr/relaxfont/font/deokon.do'
license=('custom:KOGL-3')
source=(
	'https://hanfont.hangeul.go.kr/fonts/DeogonPrincess_TTF.zip'
	#'KOGL.htm::https://www.kogl.or.kr/info/license.do'
)
sha256sums=('2b0091c42cf8cf8ac056278f2494a28fac2eaea8010734f74aac8e41681f503d')

package() {
	install -Dm644 *".ttf" -t "$pkgdir/usr/share/fonts/TTF/"
	#install -Dm644 "KOGL.htm" -t "$pkgdir/usr/share/licenses/$pkgname"
}
