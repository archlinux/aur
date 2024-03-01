# Maintainer: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=1.5.2
pkgrel=7
pkgdesc="Simple C++ library that simplifies the creation of CLI applications"
arch=(any)
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("https://github.com/RickaPrincy/$pkgname/releases/download/v$pkgver/rcli-v$pkgver.tar.gz")
sha256sums=('ca9caf0e0cf9f9b6ad88209f940a93ea99d32ad6e2ece3223f337930f8607c66')

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "rcli-v$pkgver/include" "$pkgdir/usr"
    cp -r "rcli-v$pkgver/lib" "$pkgdir/usr"
}
