# Maintainer: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=1.4.3
pkgrel=2
pkgdesc="Powerful C++ library that simplifies the creation of CLI applications"
arch=(any)
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("https://github.com/RickaPrincy/$pkgname/releases/download/v$pkgver/rcli-v$pkgver.tar.gz")
sha256sums=('81e69ea1e80f9a9b6c2d3497a838496f24a6efd578816e48167320f0713355d1')

package() {
    echo "Installing to \"$pkgdir/usr/local/\""
    mkdir -p "$pkgdir/usr/local/include"
    mkdir -p "$pkgdir/usr/local/lib"
    cp -r "include" "$pkgdir/usr/local"
    cp -r "lib" "$pkgdir/usr/local"
}