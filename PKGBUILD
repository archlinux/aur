# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=libtempli
pkgver=4.0.2
pkgrel=1
pkgdesc="Templi is a simple tool designed to expedite the template file generation process"
arch=('x86_64')
depends=('rcli' 'git')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("libtempli_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v4.0.2/libtempli_archlinux@$pkgver.tar.gz")

sha256sums=("4fa30c876c96fafb84d668c31c3f32a005914a88ea6391ac74830e696ac39e85")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "libtempli_archlinux@$pkgver/include" "$pkgdir/usr"
    cp -r "libtempli_archlinux@$pkgver/lib" "$pkgdir/usr"
}
