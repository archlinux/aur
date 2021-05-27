pkgname='khello'
pkgver=0.9
pkgrel=1
arch=('x86_64')
url='https://kurth4cker.github.io/khello'
source=("http://launchpad.net/khello/trunk/$pkgver/+download/$pkgname-$pkgver.tar.xz")
md5sums=("915a399fa6b68100778fb7115bee67cd")
description="Test and learning program created by kurth4cker."
license=("GPL")
depends=(glibc)

build () {
    cd $pkgname-$pkgver
    ./configure --prefix /usr
    make
}

package () {
    cd $pkgname-$pkgver
    make DESTDIR='$pkgdir/' install
}
