# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.1.0
pkgrel=1
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'libtempli')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_cli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.0/templi_cli_archlinux@$pkgver.tar.gz")

sha256sums=("ae518f2336899dd134358d8e41c3fc6290920f75e90e365bb41492f837ff6180")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi_cli_archlinux@$pkgver/bin" "$pkgdir/usr"
}
