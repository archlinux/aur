# Contributor foutrelis
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mimetex
pkgver=1.70
pkgrel=4
pkgdesc="tex to gif converter"
arch=('x86_64')
url="http://www.forkosh.com/mimetex.html"
license=('GPL')
source=(http://www.forkosh.com/mimetex.zip)
md5sums=('94f5ca56551df61981082d1e9fbb2d65')

build() {
  gcc -DAA mimetex.c gifsave.c -lm -o mimetex.cgi
}

package() {
  install -D -m0755 mimetex.cgi "$pkgdir"/usr/bin/mimetex.cgi
}
