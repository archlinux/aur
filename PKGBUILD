# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi_cli
pkgver=4.1.1
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-cli-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.1/templi-cli-linux-x86_64@$pkgver.tar.gz")

sha256sums=("a22e50fd3a1f69050a5ad21d10fdad05c498ebd6b7479207c51eaf176057fae6")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi-cli-linux-x86_64@$pkgver/bin" "$pkgdir/usr"
}
