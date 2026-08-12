# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=4.1.32
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-lib-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.32/templi-lib-linux-x86_64@$pkgver.tar.gz")

sha256sums=("a0016d56a8e60379a26a88705908ee63f46f403d641ecfb08043b1fc1f297b56")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "templi-lib-linux-x86_64@$pkgver/include" "$pkgdir/usr"
    cp -r "templi-lib-linux-x86_64@$pkgver/lib" "$pkgdir/usr"
}
