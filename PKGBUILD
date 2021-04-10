# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chrysalis-bin
_pkgname=${pkgname%-bin}
pkgdesc="Graphical configurator for Kaleidoscope-powered keyboards (AppImage)"
pkgver=0.8.4
pkgrel=1
arch=('x86_64')
url="https://github.com/keyboardio/${_pkgname^}"
license=('GPL3')
depends=('fuse2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("$url/releases/download/v$pkgver/${_pkgname^}-$pkgver.AppImage")
sha256sums=('b41f3e23dac855b1588cff141e3d317f96baff929a0543c79fccee0c6f095bc7')

package() {
    install -Dm755 "${_pkgname^}-$pkgver.AppImage" "$pkgdir/usr/bin/${_pkgname}"
}
