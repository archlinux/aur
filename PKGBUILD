# Maintainer: Flori4nK <contact@flori4nk.de>
pkgname="get-binary-git"
url="https://gitlab.com/flori4nk/get-binary"
pkgver=1.2.1
pkgrel=1
pkgdesc="A text to binary converter"
arch=("x86_64")
license=('MIT')
source=("https://gitlab.com/flori4nk/get-binary/-/archive/v$pkgver/get-binary-v$pkgver.tar.gz")
sha256sums=("0280af31f01ed0f15141b9f4d432b36a30818a44a99a903500431c7cd2c260a6")

build() {
    cd "get-binary-v$pkgver"
    make
}

package() {
    cd "get-binary-v$pkgver/build"
    install -dm755 "$pkgdir/usr/bin"  
    cp "get-binary" "$pkgdir/usr/bin/get-binary"   
}
