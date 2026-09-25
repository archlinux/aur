# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.2.0
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=()  # rcli and cpp_inquirer are header-only: compiled into the binary
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-cli-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.2.0/templi-cli-linux-x86_64@$pkgver.tar.gz")

sha256sums=('7171c30bfec49b0cb348ed7ff1b608406013438e871571f96ea7be2523333142')

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi-cli-linux-x86_64@$pkgver/bin" "$pkgdir/usr"
}
