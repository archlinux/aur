# Maintainer : Drew DeVault <sir@cmpwn.com>

pkgname=samurai
pkgver=0.3
pkgrel=1
pkgdesc='ninja-compatible build tool written in C'
arch=('i686' 'x86_64')
url='https://github.com/michaelforney/samurai'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/michaelforney/samurai/archive/$pkgver.tar.gz")
md5sums=('50189cae08517410f8e4d73a2098a708')

build() {
    cd "$pkgname-$pkgver"
    make samu
}

package() {
    cd "$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
} 
