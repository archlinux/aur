# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=freebsd-docs-pmake
pkgver=44714
pkgrel=1
pkgdesc="The PMake Tutorial from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/pmake/book.html-split.tar.bz2")
md5sums=('7111aab78ef2841bff755a515a49847f')

prepare() {
    rm $srcdir/book.html-split.tar.bz2        
}
package() {
    install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/pmake
    cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/pmake/
}
