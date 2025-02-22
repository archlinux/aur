# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=1.0.2
pkgrel=1
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'libtempli')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_cli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v3.2.3/templi_cli_archlinux@$pkgver.tar.gz")

sha256sums=("452c0c795a6c5b786fc8b43c42142f2bd18532fd767fe1f39bb129b68ddff02d")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi_cli_archlinux@$pkgver/bin" "$pkgdir/usr"
}
