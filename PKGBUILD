# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=freebsd-docs-faq
pkgver=r51157
pkgrel=1
pkgdesc="The FreeBSD FAQ from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("${pkgname}.book.html-split.${pkgver}.tar.bz2::ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/faq/book.html-split.tar.bz2")
sha256sums=('91c99f969688d5b3acf9cc66e41fd618e2ad3fdebc3b48b4e2998b5cf712da50')

prepare() {
  rm ${pkgname}.book.html-split.${pkgver}.tar.bz2   
}
package() {
  install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/faq
  cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/faq/
}
# vim:set ts=2 sw=2 et:
