# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="A native pdf viewer for Windows and Linux (Wayland/X11) with configurable keybindings."
arch=('x86_64')
url="https://github.com/vincent-uden/miro"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("${pkgname::-4}-${pkgver}::$url/releases/download/v${pkgver}/${pkgname::-4}")
noextract=()
sha256sums=('d27cac5afe30f8e3cb45367fd82d59c425ee8cfe9797efb22ee28770f25ad025')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm775 ${pkgname::-4}-${pkgver} "$pkgdir/usr/bin/${pkgname::-4}"
}
