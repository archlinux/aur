# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.1.31
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=('rcli' 'cpp_inquirer')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-cli-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.31/templi-cli-linux-x86_64@$pkgver.tar.gz")

sha256sums=("10bfac7dc75249c465b7f109079d05ab64fb66823f43a81dca97a796c046a2e5")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi-cli-linux-x86_64@$pkgver/bin" "$pkgdir/usr"
}
