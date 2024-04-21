# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="neopassmenu"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="Dmenu front end in POSIX shell for pass with, OTP, navigation, selection from multi-line files, and support for dmenu equivalents"
arch=('any')
depends=('pass' 'dmenu')
optdepends=('xclip: clipboard automation (X11)' 'wl-clipboard: clipboard automation (Wayland)' 'xdotool: simulate keypresses (X11)' 'ydotool: simulate keypresses (Wayland)' 'pass-otp: OTP support' 'sharutils: generate passwords')
license=('BSD')

url="https://notabug.org/BezierQuadratic/neopassmenu"

source=("https://notabug.org/BezierQuadratic/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('0f2d082aedb45e1cc379f0cde65f65c7')

package(){
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/licenses/neopassmenu"
	install -m 755 "${srcdir}/neopassmenu/neopassmenu.sh" "${pkgdir}/usr/bin/neopassmenu"
	install -m 644 "${srcdir}/neopassmenu/LICENSE" "${pkgdir}/usr/share/licenses/neopassmenu/LICENSE"
}
