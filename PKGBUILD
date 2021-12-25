# Maintainer: Klaus Ferreira <klauseverwalkingdev at yandex dot com>

pkgname="ttf-squadaone"
pkgver=20211224
pkgrel=1
pkgdesc="A bold presence and geometric, condensed typeface. It can be used at any size while still maintaining clarity and smoothness."
arch=('any')
license=('custom:SIL Open Font License')
url="https://fonts.google.com/specimen/Squada+One"
_gitver='633ebadbf5280a439a49ee831ab9446093b27f62'
source=("https://github.com/google/fonts/raw/${_gitver}/ofl/squadaone/SquadaOne-Regular.ttf"
	"https://github.com/google/fonts/raw/${_gitver}/ofl/squadaone/OFL.txt")
sha256sums=('5b34a1633dbc48db3835d8a847bc475e6e0267121d3435854729ba4b407a05df'
            'd2f9c74aba2716333b0a3d283083f9fdc93b2e060c5ae094c79e97e8cba9d7e6')
	
package() {
	install -Dm644 "SquadaOne-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/SquadaOne-Regular.ttf"
	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	}

