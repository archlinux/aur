# Maintainer: Juliette Cordor
pkgname=ignoreit-bin
pkgver=2.4.8
pkgrel=2
provides=("ignoreit")
conflicts=("ignoreit")
url="https://github.com/jewlexx/ignoreit"
arch=('x86_64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')

source=("$pkgname-$pkgver-bin::https://github.com/jewlexx/ignoreit/releases/download/v$pkgver/ignoreit-x86_64-linux")
sha256sums=('5ed41db701eb7260bc8bf7c0ff3fa15754b3b106b8b32330ab6ed1c732d7f8c6')

build() {
    return 0
}

package() {
    install -Dm755 "$pkgname-$pkgver-bin" "$pkgdir/usr/bin/ignoreit"
}
