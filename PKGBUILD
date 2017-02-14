# Maintainer: Jenya Sovetkin <edotsovetkinatgmaildotcom>
pkgname=xmeasure
pkgver=0.0.1
pkgrel=7
pkgdesc="Pixel measurement (ruler) tool on linux"
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/xmeasure"
license=('GPL2')
makedepends=('gcc')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/xmeasure/xmeasure.c")
md5sums=('dff78ab95ffee6957d849caeb3c69576')

build() {
  gcc -o xmeasure xmeasure.c -L/usr/X11R6/lib -lX11
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  cp $srcdir/xmeasure "$pkgdir"/usr/bin/
}
