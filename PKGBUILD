# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=4.1.2
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-cli-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.2/templi-cli-linux-x86_64@$pkgver.tar.gz")

sha256sums=("9033fef233a04c4cebefbee345087d034e8c00e32acb7deba55709b0d2c4a930")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "templi-cli-linux-x86_64@$pkgver/include" "$pkgdir/usr"
    cp -r "templi-cli-linux-x86_64@$pkgver/lib" "$pkgdir/usr"
}
