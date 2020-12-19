# Maintainer: Jamie Quigley <jamie (at) quigley.xyz>

pkgname=robin-hood-hashing
pkgver=3.9.1
pkgrel=1
pkgdesc="Fast & memory efficient hashtable based on robin hood hashing for C++11/14/17/20"
arch=(any)
url="https://github.com/martinus/robin-hood-hashing"
license=('MIT')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/martinus/robin-hood-hashing/archive/3.9.1.tar.gz")
sha512sums=('dbd614b772171d3e1d47e01513b3aa56d086a0530bad80931dbee4c3674e08c31cb023ac2cd3e9cadd86db76856ccc4c7a0fa9f7cd653044cd68c82e1a4c9c9c')

package() {
    cd $pkgname-$pkgver

    install -Dm644 "src/include/robin_hood.h" "$pkgdir/usr/include/robin_hood.h"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
