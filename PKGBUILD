# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=diff2html
pkgver=1.0.1
pkgrel=5
pkgdesc="diff to html"
arch=(any)
url="http://kafka.fr.free.fr/spip.php?article4"
license=('GPL')
depends=(python2)
makedepends=()
#source=(http://arch.p5n.pp.ru/~sergej/dl/2014/diff2html.bz2)
source=(http://kafka.fr.free.fr/files/diff2html/diff2html.bz2)
md5sums=('e3aa3bd4fec0a93f5f97efcd210e232b')

build() {
  sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' "$srcdir"/$pkgname
}

package() {
  install -D -m0755 "$srcdir"/$pkgname "$pkgdir"/usr/bin/$pkgname
}
