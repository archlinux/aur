# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc="Graphical configurator for Kaleidoscope-powered keyboards (AppImage)"
pkgver=0.9.5
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${_pkgname^}"
license=(GPL3)
depends=(fuse2)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
source=("$url/releases/download/v$pkgver/${_pkgname^}-$pkgver.AppImage")
sha256sums=('35d3a740a5fb4583156d13117416329b68b8465142d11e432edd31073de34d0b')

package() {
	install -Dm0755 "${_pkgname^}-$pkgver.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
