# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc="Graphical configurator for Kaleidoscope-powered keyboards (AppImage)"
pkgver=0.11.4
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${_pkgname^}"
license=(GPL3)
depends=(fuse2)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
source=("$url/releases/download/v$pkgver/${_pkgname^}-$pkgver.AppImage")
sha256sums=('03c3c66c63d301d05ab6c0a563371454350acf0bd8827ebb6739a58c00e9d8c3')

package() {
	install -Dm0755 "${_pkgname^}-$pkgver.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
