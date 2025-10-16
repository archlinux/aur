# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=miro-pdf-bin
pkgver=0.6.1
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
sha256sums=('176dc085b687b3c47aee3d63c81cf957dfd52016eb74591d68451f140fbe9b44')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm775 ${pkgname::-4}-${pkgver} "$pkgdir/usr/bin/${pkgname::-4}"
}
