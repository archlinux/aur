# Maintainer: Flori4nK <contact@flori4nk.de>
pkgname="get-binary-git"
url="https://gitlab.com/flori4nk/get-binary"
pkgver=1.2
pkgrel=1
pkgdesc="A text to binary converter"
arch=("x86_64")
license=('MIT')
source=("https://gitlab.com/flori4nk/get-binary/-/archive/v$pkgver/get-binary-v$pkgver.tar.gz")
sha256sums=("6a9e5d671cf1ca33769a8ca9691806ca5de14ea1a7f10f315f1473bfd49c2e79")

build() {
    cd "get-binary-v$pkgver"
    make
}

package() {
    cd "get-binary-v$pkgver/build"
    install -dm755 "$pkgdir/usr/bin"  
    cp "get-binary" "$pkgdir/usr/bin/get-binary"   
}
