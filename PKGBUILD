# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=routino
pkgver=3.0
pkgrel=1
pkgdesc='Router for OpenStreetMap Data'
arch=('x86_64')
url='http://www.routino.org/'
license=('AGPL3')
depends=()
makedepends=('make')
source=("http://www.routino.org/download/$pkgname-$pkgver.tgz")
sha256sums=('376512ef9627ce5c12e8c7a98dba7fe5125acfb89a9f9ee6758fbe36b5cf942f')

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="${pkgdir}" install
}
