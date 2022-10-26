# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc='Graphical configurator for Kaleidoscope-powered keyboards (AppImage)'
pkgver=0.12.0
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${_pkgname^}"
license=(GPL3)
depends=(fuse2)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
source=("$url/releases/download/v$pkgver/${_pkgname^}-$pkgver.AppImage")
sha256sums=('b10a043b550823819ba7b51b1c20b27a3b1df7896405b8bddd31f7db911a9857')

package() {
	install -Dm0755 "${_pkgname^}-$pkgver.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
