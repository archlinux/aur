# Maintainer: Shizukana Otaku <otakushizukana@gmail.com>

pkgname=hyprtheme
pkgver=1.1
pkgrel=1
pkgdesc="Stupidly simple Hyprland theme swapper."
arch=('x86_64')
url="https://github.com/Javatrix/hyprtheme"
license=('GPL')
depends=()
makedepends=('gcc')
source=("https://github.com/Javatrix/hyprtheme/archive/refs/tags/v1.1.tar.gz")
sha256sums=('db9e5c5cdef8997e9bae1474d4a9d1ebecb1ab91b5b8e67aad01cf55d169fff6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    g++ -o hyprtheme src/*
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 hyprtheme "${pkgdir}/usr/bin/hyprtheme"
}
