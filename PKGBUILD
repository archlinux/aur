# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=2.0.21
pkgrel=1
pkgdesc="Starter of styled cli for c++"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("rcli@$pkgver.tar.gz::https://github.com/RickaPrincy/rcli/releases/download/v2.0.21/rcli@$pkgver.tar.gz")

sha256sums=("6e422928a5192c2726f7655af3b7e433864d7986470ccc878a698aa22d864d62")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "rcli@$pkgver/include" "$pkgdir/usr"
    cp -r "rcli@$pkgver/lib" "$pkgdir/usr"
}
