# Maintainer: Juliette Cordor
pkgname=ignoreit-bin
pkgver=2.4.10
pkgrel=1
provides=("ignoreit")
conflicts=("ignoreit")
url="https://github.com/jewlexx/ignoreit"
arch=('x86_64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')

source=("$pkgname-$pkgver-bin::https://github.com/jewlexx/ignoreit/releases/download/v$pkgver/ignoreit-x86_64-linux")
sha256sums=('cbd50003335e4c1f9ae7aa22e37954f87f06dd4835f10a5b1a031911e62239d6')

build() {
    return 0
}

package() {
    install -Dm755 "$pkgname-$pkgver-bin" "$pkgdir/usr/bin/ignoreit"
}
