# Maintainer: Juliette Cordor
pkgname=ignoreit-bin
pkgver=2.4.7
pkgrel=1
provides=("ignoreit")
conflicts=("ignoreit")
url="https://github.com/jewlexx/ignoreit"
arch=('x86_64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')

source=("$pkgname-$pkgver-bin::https://github.com/jewlexx/ignoreit/releases/download/v$pkgver/ignoreit-$arch-linux")
sha256sums=('92d8f2a8f5a653c517e6ab71ae156088a356535e89509da8ed075cb93ffffd5f')

build() {
    return 0
}

package() {
    install -Dm755 "$pkgname-$pkgver-bin" "$pkgdir/usr/bin/ignoreit"
}
