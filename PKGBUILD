# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=4.2.0
pkgrel=1
pkgdesc="Templi is a tool that simplifies boilerplate creation and usage"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi-lib-linux-x86_64@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.2.0/templi-lib-linux-x86_64@$pkgver.tar.gz")

sha256sums=('2f394e7c057f1b76866b8e7b94db8e2c5a8fe2ce6d2b12bae362cff3aefa28c3')

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "templi-lib-linux-x86_64@$pkgver/include" "$pkgdir/usr"
    cp -r "templi-lib-linux-x86_64@$pkgver/lib" "$pkgdir/usr"
}
