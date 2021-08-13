# Maintainer: Jamie Quigley <jamie at quigley dot xyz>

pkgname=robin-hood-hashing
pkgver=3.11.3
pkgrel=1
pkgdesc="Fast & memory efficient hashtable based on robin hood hashing for C++11/14/17/20"
arch=(any)
url="https://github.com/martinus/robin-hood-hashing"
license=('MIT')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/martinus/robin-hood-hashing/archive/${pkgver}.tar.gz")
sha512sums=('SKIP')

package() {
    cd $pkgname-$pkgver

    install -Dm644 "src/include/robin_hood.h" "$pkgdir/usr/include/robin_hood.h"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
