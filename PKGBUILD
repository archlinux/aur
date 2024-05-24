pkgname=caligula-bin
pkgdesc="A lightweight, user-friendly disk imaging TUI"
pkgrel=1
pkgver=0.4.7
url="https://github.com/ifd3f/caligula"
license=("GPL-3.0")
arch=("x86_64")
provides=("caligula")
conflicts=("caligula")
source=("https://github.com/ifd3f/caligula/releases/download/v$pkgver/caligula-$CARCH-linux")
sha256sums=("c2dbe433123af4b19022ceff382b4b1926a00c7020a0a0a36ab82326b732569e")

package() {
    mv caligula-x86_64-linux caligula
    install -Dm755 caligula -t "$pkgdir/usr/bin"
}

