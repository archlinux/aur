# Maintainer: Axel Marchand <axel1.marchand@gmail.com>
# Contributor: Axel Marchand <axel1.marchand@gmail.com>
pkgname=feather
pkgver=0.2
pkgrel=2
pkgdesc="A Lightweight Window Manager"
arch=(any)
url="https://github.com/AxelMarchand/Feather"
license=('MIT')
depends=('libx11')
makedepends=('make' 'gcc')
source=('https://github.com/AxelMarchand/Feather/releases/download/v0.2/feather-0.2.tar.gz')
md5sums=('c9c60011755a3cffcf0645351569b338')

build() {
    cd $srcdir/$pkgname-$pkgver

    make || return 1
    make clean
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install || return 1
}
