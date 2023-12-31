# Maintainer: David Gale <top.map4657@mailforce.link>
pkgname=ratpoison-sloppymove
pkgver=1.0.0
pkgrel=1
pkgdesc="Improved version of sloppy focus for Ratpoison that allows for keyboard frame switches when the rat is not in motion"
arch=('x86_64')
url="https://github.com/cactus-d/ratpoison-sloppymove"
license=('GPL')
depends=('ratpoison')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cactus-d/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('5650c0f85ce192659899d62d0f4580e6')

build() {
        cd "$pkgname-$pkgver"
        make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
}
