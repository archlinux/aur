# Maintainer: Alfredo Luque <me@aluque.io>
# Maintainer: Paul Mourer <paul.mourer@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=chrysalis-bin
pkgdesc="Graphical configurator for Kaleidoscope-powered keyboards (AppImage)"
pkgver=0.7.9
pkgrel=1
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=('fuse2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
source=("$url/releases/download/${pkgname%-bin}-$pkgver/Chrysalis-$pkgver.AppImage")
sha256sums=('f10f9b69897405bec7370908d9d0aac8fbe341d2cadd89d8edfb3adecede848b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "$srcdir/Chrysalis-$pkgver.AppImage"
    cp "$srcdir/Chrysalis-$pkgver.AppImage" "$pkgdir/usr/bin/chrysalis"
}
