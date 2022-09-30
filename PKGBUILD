# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc="Graphical configurator for Kaleidoscope-powered keyboards (AppImage)"
pkgver=0.11.5
pkgrel=1
arch=(x86_64)
url="https://github.com/keyboardio/${_pkgname^}"
license=(GPL3)
depends=(fuse2)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
source=("$url/releases/download/v$pkgver/${_pkgname^}-$pkgver.AppImage")
sha256sums=('dc674e6c65bdd670ea38094771a23fe309db976106d91186ce9c18f97610d2ee')

package() {
	install -Dm0755 "${_pkgname^}-$pkgver.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
