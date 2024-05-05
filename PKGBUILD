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
sha256sums=("dc957ba1cf4a9844bf03b576054a160a673f325c14e6d87e19c9bde1d23205e6")

package() {
    mv caligula-x86_64-linux caligula
    install -Dm755 caligula -t "$pkgdir/usr/bin"
}

