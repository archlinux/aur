# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=1.0.3
pkgrel=1
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'git')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("libtempli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v3.2.3/libtempli_archlinux@$pkgver.tar.gz")

sha256sums=("6b15d44d5769734c2c334d6fdec5b79ed40f5330f128fa88c473b7fed7592cb6")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "libtempli_archlinux@$pkgver/include" "$pkgdir/usr"
    cp -r "libtempli_archlinux@$pkgver/lib" "$pkgdir/usr"
}
