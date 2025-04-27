# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.0.0
pkgrel=1
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'libtempli')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_cli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.0.0/templi_cli_archlinux@$pkgver.tar.gz")

sha256sums=("39ddc84228c8875ed6e8b21ca21d49bae2ef705d40df64fb4383d61dbeb2eb86")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi_cli_archlinux@$pkgver/bin" "$pkgdir/usr"
}
