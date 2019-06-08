# Maintainer: Justus Piater <Justus-dev at Piater dot name>
pkgname=uinputchars
pkgver=0.1
pkgrel=1
pkgdesc="A utility to type character strings into /dev/uinput"
arch=('x86_64')
url="https://github.com/piater/uinputchars"
license=('GPL3')
source=(https://github.com/piater/uinputchars/archive/v$pkgver.tar.gz)
sha256sums=('9ea51302e4aa7c155c6ffe76df6053205fba1d553fb7169e2e8fce9119c1390d')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
