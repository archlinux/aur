pkgname=caligula-bin
pkgdesc="A lightweight, user-friendly disk imaging TUI"
pkgrel=1
pkgver=0.4.4
url="https://github.com/ifd3f/caligula"
license=("GPL-3.0")
arch=("x86_64")
provides=("caligula")
conflicts=("caligula")
source=("https://github.com/ifd3f/caligula/releases/download/v$pkgver/caligula-$CARCH-linux")
sha256sums=("5fdd670ecad0c610a25f32e3ce095f567a8455f373e1183a9464f06236a7ba54")

package() {
    mv caligula-x86_64-linux caligula
    install -Dm755 caligula -t "$pkgdir/usr/bin"
}

