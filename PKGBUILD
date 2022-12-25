# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="neopassmenu"
pkgver="1.0"
pkgrel="1"
pkgdesc="Dmenu front end for pass with navigation and multiline support"
arch=('any')
depends=('pass' 'dmenu')
optdepends=('xclip: clipboard automation')
license=('BSD')

url="https://notabug.org/BezierQuadratic/neopassmenu"

source=("https://notabug.org/BezierQuadratic/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4d18ed93ca0a1cfa5c210fa12585ead1')

package(){
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/neopassmenu"
	install -m 755 "${srcdir}/neopassmenu/neopassmenu.sh" "${pkgdir}/usr/bin/neopassmenu"
	install -m 644 "${srcdir}/neopassmenu/LICENSE" "${pkgdir}/usr/share/licenses/neopassmenu/LICENSE"
}
