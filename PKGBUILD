# Maintainer: David Gale <top.map4657@mailforce.link>
pkgname=ratpoison-sloppymove
pkgver=1.0.1
pkgrel=1
pkgdesc="Improved version of sloppy focus for Ratpoison that allows for keyboard frame switches when the rat is not in motion"
arch=('x86_64')
url="https://github.com/cactus-d/ratpoison-sloppymove"
license=('GPL')
depends=('ratpoison')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cactus-d/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('cd563251ec5f9613c9b6b0dad3289200')

build() {
        cd "$pkgname-$pkgver"
        make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
}
