# Maintainer: Juliette Cordor
pkgname=ignoreit-bin
pkgver=2.4.3
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

sha256sums=('468b73468f2c7e6c3539e45449a9094d2bbb2e758d158238b1ed40976d55e90e')

build() {
    return 0
}

package() {
    install -Dm755 "$pkgname-$pkgver-bin" "$pkgdir/usr/bin/ignoreit"
}
