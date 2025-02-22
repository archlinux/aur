# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=2.0.1
pkgrel=1
pkgdesc="Starter of styled cli for c++"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("rcli@$pkgver.tar.gz::https://github.com/RickaPrincy/rcli/releases/download/v2.0.1/rcli@$pkgver.tar.gz")

sha256sums=("4397884e1a6c5b2d4b947e1b53b985c2d3115713807fe104c92d71690043dd0e")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "rcli@$pkgver/include" "$pkgdir/usr"
    cp -r "rcli@$pkgver/lib" "$pkgdir/usr"
}
