# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.0.2
pkgrel=1
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'libtempli')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_cli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.0.2/templi_cli_archlinux@$pkgver.tar.gz")

sha256sums=("cc49492091091c29d44e5a5279442b95413307e3bc7f5f324d73c7952b38f725")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi_cli_archlinux@$pkgver/bin" "$pkgdir/usr"
}
