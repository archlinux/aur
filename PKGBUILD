# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=freebsd-docs-pmake
pkgver=r44714
pkgrel=1
pkgdesc="The PMake Tutorial from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("${pkgname}.book.html-split.${pkgver}.tar.bz2::ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/pmake/book.html-split.tar.bz2")
sha256sums=('5810fb492583f451d0ea7740be5058d15ae79a50d02a3ffeecb63f8baf8bcae1')

prepare() {
  rm ${pkgname}.book.html-split.${pkgver}.tar.bz2    
}
package() {
  install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/pmake
  cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/pmake/
}
# vim:set ts=2 sw=2 et:
