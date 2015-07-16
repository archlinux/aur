# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=uncrustify0.60
pkgver=0.60
pkgrel=1
pkgdesc="A source code beautifier"
arch=('i686' 'x86_64')
url="http://uncrustify.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('0467a60b7c6f108259e69a90120afd4a')

build()
{
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
