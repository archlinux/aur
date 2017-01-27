# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=freebsd-docs-faq
pkgver=49565
pkgrel=2
pkgdesc="The FreeBSD FAQ from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/faq/book.html-split.tar.bz2")
md5sums=('75b5f622e34cc8daa6c17aa7f7f31ec1')

prepare() {
    rm $srcdir/book.html-split.tar.bz2    
}
package() {
    install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/faq
    cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/faq/
}
