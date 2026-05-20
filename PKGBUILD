# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=4.1.31
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-lib-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.31/templi-lib-linux-x86_64@$pkgver.tar.gz")

sha256sums=("a1763d22a812aa968c475498c928bd698f9ceb40753c6050b05ab965f0c7e729")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "templi-lib-linux-x86_64@$pkgver/include" "$pkgdir/usr"
    cp -r "templi-lib-linux-x86_64@$pkgver/lib" "$pkgdir/usr"
}
