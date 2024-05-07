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
sha256sums=("d008c2aeb4c6204db467bf9fe4e263ce382924b4fc19361752b33a677046303a")

package() {
    mv caligula-x86_64-linux caligula
    install -Dm755 caligula -t "$pkgdir/usr/bin"
}

