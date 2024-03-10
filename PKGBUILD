# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=1.0.0
pkgrel=2
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'libtempli')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_cli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v3.2.0/templi_cli_archlinux@$pkgver.tar.gz")

sha256sums=("4b293860a2b0fd460cbf136fc8af21b2baef98d060376a5d56d9b0c115b43f2e")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi_cli_archlinux@$pkgver/bin" "$pkgdir/usr"
}
