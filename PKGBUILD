# Maintainer: OpenSorcerer <alex at opensourcery dot eu>
pkgname=walc-appimage
pkgver=0.2.2
pkgrel=2
pkgdesc="An unofficial WhatsApp Desktop client for Linux systems – AppImage binary"
arch=('x86_64')
url="https://github.com/WAClient/WALC"
license=('GPL3')
depends=('zlib')
source=("$url/releases/download/v$pkgver/WALC-$pkgver.AppImage")
sha256sums=('8acf7bc0ef68692417360273c9e63f5f6bf139e63052bc87adafb308520364e9')
options=('!strip')

package() {
    install -Dm755 "WALC-$pkgver.AppImage" "$pkgdir/usr/bin/walc"
}
