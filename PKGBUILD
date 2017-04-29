# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=freebsd-docs-faq
pkgver=50131
pkgrel=1
pkgdesc="The FreeBSD FAQ from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/faq/book.html-split.tar.bz2")
md5sums=('762a02ba5f08536cf2def8a55a2112ed')

prepare() {
    rm $srcdir/book.html-split.tar.bz2    
}
package() {
    install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/faq
    cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/faq/
}
