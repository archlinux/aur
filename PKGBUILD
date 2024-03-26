# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=1.0.1
pkgrel=1
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'libtempli')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_cli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v3.2.1/templi_cli_archlinux@$pkgver.tar.gz")

sha256sums=("becaa826f43dac450741b7efd43909b7032c03b4267f3d6b28081d8c9e6c1b2f")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi_cli_archlinux@$pkgver/bin" "$pkgdir/usr"
}
