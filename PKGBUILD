# Maintainer: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=1.5.1
pkgrel=6
pkgdesc="Simple C++ library that simplifies the creation of CLI applications"
arch=(any)
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("https://github.com/RickaPrincy/$pkgname/releases/download/v$pkgver/rcli-v$pkgver.tar.gz")
sha256sums=('6606d1eb4b9cb752cee6e0c5fa3bf993f2eee9b28d225e3ec1d0dabaac2f7aa2')

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "rcli-v$pkgver/include" "$pkgdir/usr"
    cp -r "rcli-v$pkgver/lib" "$pkgdir/usr"
}
