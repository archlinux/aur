# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=2.0.0
pkgrel=1
pkgdesc="Starter of styled cli for c++"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/rcli.git"
license=('MIT')
source=("rcli@$pkgver.tar.gz::https://github.com/RickaPrincy/rcli.git/releases/download/v2.0.0/rcli@$pkgver.tar.gz")

sha256sums=("c2430be57edf53196175713cc5c493132d64f2c7ebb4d401db599ba5adf5060a")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "rcli@$pkgver/include" "$pkgdir/usr"
    cp -r "rcli@$pkgver/lib" "$pkgdir/usr"
}
