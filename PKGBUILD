# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=4.1.3
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-lib-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.3/templi-lib-linux-x86_64@$pkgver.tar.gz")

sha256sums=("8858f0cc384d9a7b3616e902a81162d7d56d75e6e1248ca94e24e9ebefb5a0b2")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "templi-cli-linux-x86_64@$pkgver/include" "$pkgdir/usr"
    cp -r "templi-cli-linux-x86_64@$pkgver/lib" "$pkgdir/usr"
}
