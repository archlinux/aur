# Maintainer: Juliette Cordor
pkgname=ignoreit-bin
pkgver=2.4.9
pkgrel=1
provides=("ignoreit")
conflicts=("ignoreit")
url="https://github.com/jewlexx/ignoreit"
arch=('x86_64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')

source=("$pkgname-$pkgver-bin::https://github.com/jewlexx/ignoreit/releases/download/v$pkgver/ignoreit-x86_64-linux")
sha256sums=('28cf995c24cf72b80bdc637f151d4007babcdfe11832786830c52b4645545252')

build() {
    return 0
}

package() {
    install -Dm755 "$pkgname-$pkgver-bin" "$pkgdir/usr/bin/ignoreit"
}
