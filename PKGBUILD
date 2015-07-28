# $Id$
# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: tuxayo <victor@tuxayo.net>
# Contributor: netcrusher < tobias AT miglix DOT eu >

pkgname=makeheaders
pkgver=1.0
pkgrel=2
pkgdesc="simple utility that will automatically generate .h files from .{c,cpp} files"
arch=('i686' 'x86_64')
url="http://www.hwaci.com/sw/mkhdr/"
source=("http://www.hwaci.com/sw/mkhdr/makeheaders.c")
license=('BSD')
sha256sums=('a03498d80e29c836b1525cd2aad7f2f75c80e8dfcd533dd619ac0fe0c5cef2cd')

build() {
  cd "$srcdir"
  make makeheaders
}

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/makeheaders"
}

