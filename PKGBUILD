# Maintainer: purpletue, purpletuesdayofficial@gmail.com 
pkgname=langman
pkgver=1.0.0
pkgrel=1
pkgdesc="A single-binary language tutorial reference tool"
arch=('x86_64')
license=('MIT')
source=('main.c')
sha256sums=('SKIP')

build() {
    gcc -O3 -v main.c -o langman
}

package() {
    install -Dm755 langman "$pkgdir/usr/bin/langman"
}
