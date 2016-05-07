# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=lucidor
pkgver=0.9.11
pkgrel=1
pkgdesc="A program for reading and handling EPUB e-books and OPDS catalogs"
arch=('i686' 'x86_64')
url="http://lucidor.org/lucidor/"
license=('GPL3')
depends=('xulrunner' 'desktop-file-utils')
install=$pkgname.install
source=(${pkgname}_${pkgver}.tar.gz::"http://lucidor.org/get.php?id=${pkgname}_${pkgver}.tar.gz")
md5sums=('370a8a25a96bbcb3d930d684f8c49d8c')

build()
{
    cd $srcdir/$pkgname-$pkgver
    make
}

package()
{
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
