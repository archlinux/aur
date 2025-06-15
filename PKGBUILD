# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=2.0.23
pkgrel=1
pkgdesc="Library to parse user command-line input"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("rcli@$pkgver.tar.gz::https://github.com/RickaPrincy/rcli/releases/download/v2.0.23/rcli@$pkgver.tar.gz")

sha256sums=("bd430939e0a011e9a00e7f18097b20f6da208634900148038fa453804f9568d9")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "rcli@$pkgver/include" "$pkgdir/usr"
    cp -r "rcli@$pkgver/lib" "$pkgdir/usr"
}
