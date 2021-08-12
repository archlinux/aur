# Inmarsat-C library
# Maintainer: cropinghigh <joinmark60@gmail.com>
pkgname=libinmarsatc-git
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Inmarsat-C Open-source library based on Scytale-c"
license=('GPL')
source=("git://github.com/cropinghigh/inmarsatc")
md5sums=('SKIP')

build() {
    cd $srcdir/inmarsatc
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd $srcdir/inmarsatc/build
    make DESTDIR="$pkgdir/" install
}
