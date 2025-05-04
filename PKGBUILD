# Author: RickaPrincy <rckprincy@gmail.com>
pkgname=rcli
pkgver=2.0.2
pkgrel=1
pkgdesc="Starter of styled cli for c++"
arch=('x86_64')
depends=()
url="https://github.com/RickaPrincy/rcli"
license=('MIT')
source=("rcli@$pkgver.tar.gz::https://github.com/RickaPrincy/rcli/releases/download/v2.0.2/rcli@$pkgver.tar.gz")

sha256sums=("c4975a80e9487764e91714ddf94998c2635a2c4332ec94d0c431d0fe207d0bf2")

package() {
    echo "Installing to \"$pkgdir/usr/\""
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/lib"
    cp -r "rcli@$pkgver/include" "$pkgdir/usr"
    cp -r "rcli@$pkgver/lib" "$pkgdir/usr"
}
