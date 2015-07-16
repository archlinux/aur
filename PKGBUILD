# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname=uncrustify0.60
pkgver=0.60
pkgrel=2
pkgdesc="A source code beautifier, version 0.60"
arch=('i686' 'x86_64')
url="http://uncrustify.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=("https://github.com/bengardner/uncrustify/archive/uncrustify-0.60.tar.gz")
md5sums=('aa1c2f5d8ee0db959305f0d4a3e0a298')

build()
{
    cd "$srcdir/uncrustify-uncrustify-0.60"
    ./configure --prefix=/usr
    make
}

package()
{
    cd "$srcdir/uncrustify-uncrustify-0.60"
    make DESTDIR=$pkgdir install
}
