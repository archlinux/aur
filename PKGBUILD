# Maintainer: Vladislav Litvinov <vlad@sek1.ro>
pkgname=libbasen
pkgver=1.0.1
pkgrel=1
pkgdesc="c++ encoding/decoding from arbitrary base"
arch=('any')
url="https://github.com/vSEK1RO/libbasen"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make -j $(nproc)
}

package() {
    cd "$pkgname-$pkgver"
    make i USRDIR=$pkgdir/usr
}