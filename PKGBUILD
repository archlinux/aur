
pkgname=ojcsh
pkgver=3.0.0
pkgrel=1
pkgdesc="A lightweight Unix-like shell written in C — final release of OJC-shell"
keywords=('shell' 'unix' 'c' 'terminal' 'cli' 'lightweight' 'minimal')
arch=('x86_64')
url="https://github.com/ABO7GAG/OJC-shell"
license=('GPL-3.0-or-later')
depends=('glibc' 'readline')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ABO7GAG/OJC-shell/archive/refs/tags/V3.0.0.tar.gz")
sha256sums=('49c9fb34102d12cac76ad140e774d2d63c41e1b5750494f832619ab9d9d5da86')

build() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    make
}

package() {
    cd "$srcdir/OJC-shell-$pkgver/src"
    install -Dm755 ojcsh "$pkgdir/usr/bin/ojcsh"
}

