# Maintainer: Axel Marchand <axel1.marchand@gmail.com>
# Contributor: Axel Marchand <axel1.marchand@gmail.com>
pkgname=feather
pkgver=0.1
pkgrel=1
pkgdesc="A Lightweight Window Manager"
arch=(any)
url="https://github.com/AxelMarchand/Feather"
license=('MIT')
depends=('libx11')
makedepends=('make' 'gcc')
source=('https://github.com/AxelMarchand/Feather/releases/download/v0.1/feather-0.1.tar.gz')
md5sums=('790873e0eaa2154a6756821439182702')

build() {
    cd $srcdir/$pkgname-$pkgver

    make || return 1
    make clean
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install || return 1
}
