# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=halide-bin
pkgver=20120802
pkgrel=1
pkgdesc="A language for image processing and computational photography, precompiled version."
arch=('x86_64')
url="http://halide-lang.org/"
license=('MIT')
depends=('gcc>4.6')
source=(https://github.com/downloads/halide/Halide/halide-linux64.tgz)
md5sums=('f10795403da5b3be3410c9da0006f408')

package() {
  cd "$srcdir/halide"
  install -Dm0755 libHalide.a "$pkgdir/usr/lib/libHalide.a"
  install -Dm0744 Halide.h "$pkgdir/usr/include/Halide.h"
}


