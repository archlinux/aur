# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc='Graphical configurator for Kaleidoscope-powered keyboards (AppImage)'
pkgver=0.11.9
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${_pkgname^}"
license=(GPL3)
depends=(fuse2)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
source=("$url/releases/download/v$pkgver/${_pkgname^}-$pkgver.AppImage")
sha256sums=('09ee9aab8259dbbd634f3028519c7a6d9a664145e686116069e99f65fa244b6e')

package() {
	install -Dm0755 "${_pkgname^}-$pkgver.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
