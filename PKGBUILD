# Maintainer: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=1.4.2
pkgrel=1
pkgdesc="rcli is a powerful C++ library that simplifies the creation of CLI applications"
arch=(any)
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("https://github.com/RickaPrincy/$pkgname/releases/download/v$pkgver/rcli-v$pkgver.tar.gz")
sha256sums=('e37a7cdd33cd54d83ce00cc0c85744c28f4b06e71318e57418b157e950f3d935')

package() {
    echo "Installing to \"$pkgdir/usr/local/\""
    mkdir -p "$pkgdir/usr/local/include"
    mkdir -p "$pkgdir/usr/local/lib"
    cp -r "include" "$pkgdir/usr/local"
    cp -r "lib" "$pkgdir/usr/local"
}