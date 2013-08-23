# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=gnuplotme
pkgver=0.5
pkgrel=1
pkgdesc="A simple intuitive front-end script for gnuplot"
arch=('i686' 'x86_64')
url="http://www.jamjoom.net/tools/gnuplotme/gnuplotme.html"
license=('unknown')
depends=('perl' 'gnuplot')
source=(http://www.jamjoom.net/tools/$pkgname/$pkgname)
md5sums=('27686ba9e503400323672319151e9c2b')

build() {
  cd $srcdir
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
