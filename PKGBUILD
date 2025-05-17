# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=4.1.1
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=('rcli' 'git')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-cli-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.1.1/templi-cli-linux-x86_64@$pkgver.tar.gz")

sha256sums=("369f29d2cb3f00c56889101c06612b0ec3de0a3353fdd5aea6900f11b7b75886")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "templi-cli-linux-x86_64@$pkgver/include" "$pkgdir/usr"
    cp -r "templi-cli-linux-x86_64@$pkgver/lib" "$pkgdir/usr"
}
