# Maintainer: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=1.5.1
pkgrel=5
pkgdesc="Simple C++ library that simplifies the creation of CLI applications"
arch=(any)
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("https://github.com/RickaPrincy/$pkgname/releases/download/v$pkgver/rcli-v$pkgver.tar.gz")
sha256sums=('6606d1eb4b9cb752cee6e0c5fa3bf993f2eee9b28d225e3ec1d0dabaac2f7aa2')

package() {
    echo "Installing to \"$pkgdir/usr/local/\""
    mkdir -p "$pkgdir/usr/local/include"
    mkdir -p "$pkgdir/usr/local/lib"
    cp -r "rcli-v$pkgver/include" "$pkgdir/usr/local"
    cp -r "rcli-v$pkgver/lib" "$pkgdir/usr/local"
}
