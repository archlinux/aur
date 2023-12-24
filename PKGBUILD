# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=templi
pkgver=3.0.0
pkgrel=1
pkgdesc="Templi is a groundbreaking tool designed to expedite the template file generation process"
arch=('x86_64')
url="https://github.com/RickaPrincy/Templi"
license=('MIT')
source=("templi_archlinux@$pkgver.tar.gz::https://github.com/RickaPrincy/Templi/releases/download/v$pkgver/templi_archlinux@$pkgver.tar.gz")

sha256sums=("c861ab51e5dc5cc2ca257c5f6d73236cef155fdbd940b923ca9b5b99eb517b26")

package() {
    mkdir -p "$pkgdir/usr/bin/"
    cp -r "$srcdir/templi" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/templi"
}
