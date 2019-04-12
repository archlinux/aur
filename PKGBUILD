# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=siddasm
pkgver=1.0
pkgrel=2
pkgdesc="Written by Gufino, this program produces disassembler output of .SID music files, so that you'll be able to see the musicroutine code."
arch=('i686' 'x86_64')
url="http://cadaver.homeftp.net/tools.htm"
source=(https://cadaver.github.io/tools/siddasm1.tar.gz)
license=('custom')
provides=("$pkgname")
makedepends=('gcc')

build() {
  cd "$srcdir"
  gcc -o $pkgname siddasm1.c 
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 ./$pkgname "$pkgdir/usr/bin"
}
md5sums=('f73d5109a777a09751c7e742a39551a9')
