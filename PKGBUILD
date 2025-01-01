pkgname=asciiconv
pkgver=1.0.0
pkgrel=1
pkgdesc="AsciiConv is a program for creating Ascii art in Python. Read more on GitHub"
arch=('x86_64')
url="https://github.com/1RoboTron/AsciiConv"
license=('BSD')
makedepends=('make')
source=("https://github.com/1RoboTron/AsciiConv/archive/refs/tags/1.0.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/AsciiConv-1.0"
    make 
}

package() {
    cd "AsciiConv-1.0"
    install -Dm755 asciiconv "$pkgdir/usr/bin/asciiconv"
}

