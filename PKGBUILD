# Maintainer: Juliette Cordor
pkgname=ignoreit-bin
pkgver=2.4.6
pkgrel=1
provides=("ignoreit")
conflicts=("ignoreit")
url="https://github.com/jewlexx/ignoreit"
arch=('x86_64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')
source=(
    "$pkgname-$pkgver-bin::https://github.com/jewlexx/ignoreit/releases/download/v$pkgver/ignoreit-$arch-linux"
)

sha256sums=('2ac051a6bfeb8d529785d78a5962b8d3679aa6f8209cf60af6fe2d4a4ef5d9a2')

build() {
    return 0
}

package() {
    install -Dm755 "$pkgname-$pkgver-bin" "$pkgdir/usr/bin/ignoreit"
}
