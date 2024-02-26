# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi
pkgver=3.1.0
pkgrel=2
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v$pkgver/templi_archlinux@$pkgver.tar.gz")

sha256sums=("dd9a55ffa1fd22df3f5ee7f157be84df313f9bab674882f87a0f3a29b4b8eb6d")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "templi_archlinux@$pkgver/include" "$pkgdir/usr"
    cp -r "templi_archlinux@$pkgver/lib" "$pkgdir/usr"
    cp -r "templi_archlinux@$pkgver/bin" "$pkgdir/usr"
}
