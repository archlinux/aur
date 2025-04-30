# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.0.1
pkgrel=1
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'libtempli')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_cli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.0.1/templi_cli_archlinux@$pkgver.tar.gz")

sha256sums=("f2d00b0f36eed4bedb09a6229811d9c6ccab08d43e6b6c651e3b00519bfe48d4")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi_cli_archlinux@$pkgver/bin" "$pkgdir/usr"
}
