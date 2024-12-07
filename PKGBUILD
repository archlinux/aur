pkgname=plasma-classic-wallpapers
pkgver=2.0.1
pkgrel=2
arch=(any)
builddepends=(extra-cmake-modules cmake)
source=(https://github.com/MartinF99/plasma-classic-wallpapers/archive/refs/tags/2.0.1.tar.gz)
sha256sums=('e7fb70bb5af2601857dd5b1f22500c10b5b73f7319a431954d24e200ea088f68')
license=('LGPL-3.0')
build(){
    cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
}

package(){
    DESTDIR=$pkgdir cmake --install $srcdir/build
}
