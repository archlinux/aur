# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=2.0.22
pkgrel=1
pkgdesc="Starter of styled cli for c++"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("rcli@$pkgver.tar.gz::https://github.com/RickaPrincy/rcli/releases/download/v2.0.22/rcli@$pkgver.tar.gz")

sha256sums=("3cc6ea193d5d674ca8d7b9f49423f4fee2942ca112806f331d8c93c4d0923086")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "rcli@$pkgver/include" "$pkgdir/usr"
    cp -r "rcli@$pkgver/lib" "$pkgdir/usr"
}
