# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=chrysalis-bin
pkgdesc="Graphical configurator for Kaleidoscope-powered keyboards (AppImage)"
pkgver=0.8.0
pkgrel=1
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=('fuse2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("$url/releases/download/${pkgname%-bin}-$pkgver/Chrysalis-$pkgver.amd64.AppImage")
sha256sums=('55f4634599dfd420935a5c8d9e8012495273325aceb176bfcb366a0ca34b96f6')

package() {
    install -Dm755 "Chrysalis-$pkgver.amd64.AppImage" "$pkgdir/usr/bin/chrysalis"
}
