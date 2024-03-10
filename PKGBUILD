# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=1.0.0
pkgrel=2
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'git')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("libtempli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v3.2.0/libtempli_archlinux@$pkgver.tar.gz")

sha256sums=("abc5951f11e8716bf15ef7d98531bf8d0e9c18da1661ec90ec99f5b0d556ed6c")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "libtempli_archlinux@$pkgver/include" "$pkgdir/usr"
    cp -r "libtempli_archlinux@$pkgver/lib" "$pkgdir/usr"
}
