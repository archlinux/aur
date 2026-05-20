# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.1.3
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=('rcli' 'cpp_inquirer')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-cli-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.3/templi-cli-linux-x86_64@$pkgver.tar.gz")

sha256sums=("f899bdf0ecf8ebe9167842054ffc848ad6442d6152a089dfe50442b7514bd3ef")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi-cli-linux-x86_64@$pkgver/bin" "$pkgdir/usr"
}
