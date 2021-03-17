pkgname='kos32-kpack'
pkgver=r8092
pkgrel=1
pkgdesc="KolibriOS executable compression."
url="http://wiki.kolibrios.org/wiki/Kpack/ru"
source=("kpack.r8092.tar.gz")
license=('GPLv2')
arch=('any')
md5sums=('SKIP')
conflicts=('kpack' 'kpack-git') 
makedepends=('fasm')

build(){
    cd "$srcdir/kpack.r8092"
    make
}

package() {
    cd "$srcdir/kpack.r8092"
    mkdir -p $pkgdir/usr/bin
    make install DIR=$pkgdir/usr/bin
}
