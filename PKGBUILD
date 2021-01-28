# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc="Graphical configurator for Kaleidoscope-powered keyboards (AppImage)"
pkgver=0.8.2
pkgrel=1
arch=('x86_64')
url="https://github.com/keyboardio/${_pkgname^}"
license=('GPL3')
depends=('fuse2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("$url/releases/download/v$pkgver/${_pkgname^}-$pkgver.AppImage")
sha256sums=('e72c8110cd49fe76dbd370b2ea5e68b507bafa6c3fc4f2b8b00186536a2215f9')

package() {
    install -Dm755 "${_pkgname^}-$pkgver.AppImage" "$pkgdir/usr/bin/${_pkgname}"
}
