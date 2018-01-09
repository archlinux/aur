# Maintainer : Drew DeVault <sir@cmpwn.com>

pkgname=samurai
pkgver=0.2
pkgrel=1
pkgdesc='ninja-compatible build tool written in C'
arch=('i686' 'x86_64')
url='https://github.com/michaelforney/samurai'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/michaelforney/samurai/archive/0.2.tar.gz")
md5sums=('c74fc84afcef3ac527f369ad83f74728')

build() {
    cd "$pkgname-$pkgver"
    make samu
}

package() {
    cd "$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
} 
