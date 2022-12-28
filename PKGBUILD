# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="neopassmenu"
pkgver="1.0.2"
pkgrel="1"
pkgdesc="Dmenu front end in POSIX shell for pass with navigation, selection from multi-line files, and support for dmenu equivalents"
arch=('any')
depends=('pass' 'dmenu')
optdepends=('xclip: clipboard automation (X11)' 'wl-clipboard: clipboard automation (Wayland)')
license=('BSD')

url="https://notabug.org/BezierQuadratic/neopassmenu"

source=("https://notabug.org/BezierQuadratic/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e6897b31755fca261fc9a50eb3d727d9')

package(){
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/neopassmenu"
	install -m 755 "${srcdir}/neopassmenu/neopassmenu.sh" "${pkgdir}/usr/bin/neopassmenu"
	install -m 644 "${srcdir}/neopassmenu/LICENSE" "${pkgdir}/usr/share/licenses/neopassmenu/LICENSE"
}
