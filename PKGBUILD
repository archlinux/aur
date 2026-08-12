# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.1.32
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=('rcli' 'cpp_inquirer')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-cli-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.32/templi-cli-linux-x86_64@$pkgver.tar.gz")

sha256sums=("08b3cf7cbb418eac97f942fee7178ab8c048aba625c879a894140800bdc997de")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi-cli-linux-x86_64@$pkgver/bin" "$pkgdir/usr"
}
