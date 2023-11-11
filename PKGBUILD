pkgname=caligula-bin
pkgdesc="A lightweight, user-friendly disk imaging TUI"
pkgrel=1
pkgver=0.4.3
url="https://github.com/ifd3f/caligula"
license=("GPL-3.0")
arch=("x86_64")
provides=("caligula")
conflicts=("caligula")
source=("https://github.com/ifd3f/caligula/releases/download/v$pkgver/caligula-$CARCH-linux")
sha256sums=("15ce35f702f2afdd78cb8d829f24bb9a9ab2661c350f30c7cffe577326b9ef73")

package() {
    mv caligula-x86_64-linux caligula
    install -Dm755 caligula -t "$pkgdir/usr/bin"
}

