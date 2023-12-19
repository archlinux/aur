# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc='Graphical configurator for Kaleidoscope-powered keyboards (AppImage)'
pkgver=0.13.3
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${_pkgname^}"
license=(GPL3)
depends=(fuse2)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver-x64.AppImage"
source=("$url/releases/download/v$pkgver/$_archive")
sha256sums=('7d3fb145a21bd1644d344c4e3c88c87390fdd9efe2c4fde4c584ec6099cb1339')

package() {
	install -Dm0755 "$_archive" "$pkgdir/usr/bin/$_pkgname"
}
