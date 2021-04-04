# Maintainer: luc4 <carlon.luca [/at\] gmail DOT com>

pkgname=logcat-colorize
pkgver=0.10.0
pkgrel=2
pkgdesc="A simple program that colorizes Android Debug Bridge (adb)'s logcat output on a terminal window."
url="https://github.com/carlonluca/logcat-colorize"
depends=(boost-libs gcc-libs)
makedepends=(git boost)
arch=('any')
license=('Apache')
source=('git+https://github.com/carlonluca/logcat-colorize.git#tag=v0.10.0')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}
