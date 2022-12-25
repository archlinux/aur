# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="neopassmenu"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Dmenu front end in POSIX shell for pass with navigation, selection from multi-line files, and support for dmenu equivalents"
arch=('any')
depends=('pass' 'dmenu')
optdepends=('xclip: clipboard automation')
license=('BSD')

url="https://notabug.org/BezierQuadratic/neopassmenu"

source=("https://notabug.org/BezierQuadratic/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b23ac7e608e3535a6914eabab33fd3be')

package(){
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/neopassmenu"
	install -m 755 "${srcdir}/neopassmenu/neopassmenu.sh" "${pkgdir}/usr/bin/neopassmenu"
	install -m 644 "${srcdir}/neopassmenu/LICENSE" "${pkgdir}/usr/share/licenses/neopassmenu/LICENSE"
}
