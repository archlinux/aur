# Maintainer: Flori4nK <contact@flori4nk.de>
pkgname="get-binary-git"
url="https://gitlab.com/flori4nk/get-binary"
pkgver=1.2.2
pkgrel=1
pkgdesc="A text to binary converter"
arch=("x86_64")
license=('MIT')
source=("https://gitlab.com/flori4nk/get-binary/-/archive/v$pkgver/get-binary-v$pkgver.tar.gz")
sha256sums=("2e4e6c908729a96e19f06757f6fc3ed8d15c78c14ee34f0c5b9d55dcbb6ddcfc")

build() {
    cd "get-binary-v$pkgver"
    make
}

package() {
    cd "get-binary-v$pkgver/build"
    install -dm755 "$pkgdir/usr/bin"  
    cp "get-binary" "$pkgdir/usr/bin/get-binary"   
}
