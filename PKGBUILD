# Maintainer : Drew DeVault <sir@cmpwn.com>

pkgname=samurai
pkgver=0.5
pkgrel=1
pkgdesc='ninja-compatible build tool written in C'
arch=('i686' 'x86_64')
url='https://github.com/michaelforney/samurai'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/michaelforney/samurai/archive/$pkgver.tar.gz")
md5sums=('1ec644e673773fe18857f6c4cc49d568')

build() {
    cd "$pkgname-$pkgver"
    make samu
}

package() {
    cd "$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
} 
