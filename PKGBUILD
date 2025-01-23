pkgname=asciiconv
pkgver=1.0.0
pkgrel=1
pkgdesc="AsciiConv is a program for creating Ascii art in Python. Read more on GitHub"
arch=('x86_64')
url="https://github.com/1RoboTron/AsciiConv"
license=('BSD')
makedepends=('make')
source=("https://github.com/1RoboTron/AsciiConv/archive/refs/tags/asciiconv-1.1.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/AsciiConv-asciiconv-1.1"
    make 
}

package() {
    cd "AsciiConv-asciiconv-1.1"
    install -Dm755 asciiconv "$pkgdir/usr/bin/asciiconv"
}

