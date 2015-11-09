# Maintainer: tri <trile7 at gmail dot com>
pkgname=xmeasure
pkgver=0.0.1
pkgrel=4
pkgdesc="Pixel measurement (ruler) tool on linux"
arch=('i686' 'x86_64')
url="http://xmeasure.googlecode.com"
license=('GPL2')
makedepends=('gcc')
source=("$url/files/xmeasure.c")
md5sums=('dff78ab95ffee6957d849caeb3c69576')

build() {
  gcc -o xmeasure xmeasure.c -L/usr/X11R6/lib -lX11
  mkdir -p "$pkgdir"/usr/bin
  cp $srcdir/xmeasure "$pkgdir"/usr/bin/
}
