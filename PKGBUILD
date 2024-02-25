# Maintainer: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=1.5.1
pkgrel=4
pkgdesc="Simple C++ library that simplifies the creation of CLI applications"
arch=(any)
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("https://github.com/RickaPrincy/$pkgname/releases/download/v$pkgver/rcli-v$pkgver.tar.gz")
sha256sums=('761ef93c7b9a2df3573fb15f009a40bd0fa8155a6ecce7d373a7008ecba73968')

package() {
    echo "Installing to \"$pkgdir/usr/local/\""
    mkdir -p "$pkgdir/usr/local/include"
    mkdir -p "$pkgdir/usr/local/lib"
    cp -r "rcli-v$pkgver/include" "$pkgdir/usr/local"
    cp -r "rcli-v$pkgver/lib" "$pkgdir/usr/local"
}
