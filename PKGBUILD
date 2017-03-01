# Maintainer: doboszsite<doboszsite@gmail.com>

_pkgname=hexdiff
pkgname=$_pkgname
pkgver=0.0.50
pkgrel=1
url="http://tboudet.free.fr/hexdiff/"
pkgdesc="Visual hexadecimal difference editor"
arch=('i686' 'x86_64')
depends=('ncurses')
source=('http://tboudet.free.fr/hexdiff/hexdiff.tar.gz')
md5sums=('68dbf4c610f4fd1817401bcf6c671b71')
build() {
  tar zxvf hexdiff.tar.gz
  cd "$srcdir/HexDiff"
  make hexdiff
}

package() {
  install -D -m 755 "$srcdir/HexDiff/hexdiff" "$pkgdir/usr/bin/hexdiff" 
}

